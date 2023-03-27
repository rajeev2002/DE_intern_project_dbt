{%- macro alter_column(table,columnList) -%}

    {%- set alter_query -%}
          ALTER TABLE {{table}} ADD COLUMN losses double, gameWon int ,gameLost int;

        {% for columnn in columnList %}
            UPDATE {{table}}
            SET {{columnn}} = CASE 
            {% if columnn == 'losses' %}
            WHEN profit =0 THEN bet  
                ELSE 0  
                END ; 
    {% elif columnn=='gameWon' %}

        WHEN profit=0 THEN 0  
        ELSE 1  
        END ;
        {%else %}
        WHEN profit=0 THEN 1  
    ELSE 0  
    END ;
    {% endif %}       
     {% endfor %}
    {%- endset -%}
    {% do run_query(alter_query) %}
{%- endmacro -%}












