<template>
    <div class="default-main-layout h-full overflow-hidden">
        <div class="header bg-gray-50 h-[60px]">
            header
        </div>
        <div class="content bg-gray-100 h-[calc(100vh-140px)]">
            <slot />
        </div>
        <div class="footer bg-gray-50 h-[80px]">
            footer
        </div>
    </div>
</template>