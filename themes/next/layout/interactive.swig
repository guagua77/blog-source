{% extends '_layout.swig' %}

{% block title %}{{ page.title }} | {{ config.title }}{% endblock %}

{% block content %}
<div class="interactive-container">
  <article class="post" itemscope itemtype="http://schema.org/BlogPosting">
    <header class="post-header">
      <h1 class="post-title" itemprop="name headline">{{ page.title }}</h1>
      <div class="post-meta">
        <time datetime="{{ date_xml(page.date) }}" itemprop="datePublished">
          {{ date(page.date, 'YYYY-MM-DD') }}
        </time>
      </div>
    </header>

    <div class="post-body" itemprop="articleBody">
      {{ page.content }}
    </div>
  </article>
</div>
{% endblock %}
