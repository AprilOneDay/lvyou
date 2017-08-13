<?php
class template
{
    public $stampLeft  = '{';
    public $stampRight = '}';
    public $viewPath;
    public $content;

    public function getContent($viewPath)
    {
        $file          = fopen($viewPath, 'r');
        $this->content = fread($file, filesize($viewPath));
        $this->stampIf($this->content);
    }

    public function stampIf()
    {
        $this->content = str_replace($this->stampLeft . 'if', '<?php if(', $this->content);
        /*$this->content = str_replace($this->stampRight, '){?>', $this->content);*/
        $this->content = str_replace($this->stampLeft . '/if' . $this->stampRight, '<?php } ?>', $this->content);
        var_dump($this->content);
    }
}
