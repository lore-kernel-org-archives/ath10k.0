Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E23C27C79
	for <ath10k@archiver.kernel.org>; Thu, 20 Jun 2024 19:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxmltmQrKwAluprbf/AG1nvFIcYg57/7dnDwU0ucSDg=; b=QCY9urbQHwqRXSM16q1bajzpLy
	HjRTYgpWdUUHuZHzhfJv2wSpbOQudoPLR+OcxvuP9YzwsSkH+nV0ETzaS+snjG4Mg5PkfDb/mRq5+
	uTCuVzzlG0VgcniirSsZJYMYtN6w1Z5CcsXgoen3Yr2BRo90RIy8mIOnBjD8xPLo+y7buYOAMYBS9
	6VftneGpp8FggsBgS7hoisQCpeT/0PMXFwG1pbfnkpoMyhIiKeOIxzhMN3q4ufpfrfBu9QqVPxvtr
	JRfWEH1zE1bbaG9P39yFBir+I5Pn6lzW1fVgOPE9dQWpXu2ooh/8lx7URHPtRtzwxMmuhoQ3B+Ug+
	BR6DY5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKNWP-00000006TFz-1bQ1;
	Thu, 20 Jun 2024 19:32:37 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKNWJ-00000006TFF-1QOX
	for ath10k@lists.infradead.org;
	Thu, 20 Jun 2024 19:32:33 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a63359aaacaso189151866b.1
        for <ath10k@lists.infradead.org>; Thu, 20 Jun 2024 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718911949; x=1719516749; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rxmltmQrKwAluprbf/AG1nvFIcYg57/7dnDwU0ucSDg=;
        b=b+NlLa+Z1vQJvL2Ab0dfPhX3gRESW6rAnjcun0ju9mBK6aDlAyjwqDt7cpY6ASXkZN
         DZktrOSiqk7dwDB02tswXXpyqcjZNFf/VT1nw7QRgEy8t68bWd4dYGnpsxhn+uiRMmNm
         0RW22KpOsVFGdDHWMKKhfwqMINQTUTSr/oXKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718911949; x=1719516749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxmltmQrKwAluprbf/AG1nvFIcYg57/7dnDwU0ucSDg=;
        b=l1kiO/N7FvaSI4ODMwy9xjhtwJ8wGOrth4YEHbaRlllSR5x7HPUQSSshTh0KRQpA7j
         U/3Y6yoVcr1bJD8f9y3uPx5DoP7WX4nJo+S2E/W/VsWdnnYO9l1d9E1JGQIMkqxjH/Xr
         /L/Jb34WcmOb4rE0tF4cERHYvd3cY0FhsIOHDnFGCUFT1mcccmZgNje0Ek9qi7FYIljX
         ZucnIx9GQnH7hF0tifZ9Rj2JNh2dkQUnJsCaEj7/JRj5QxaA5nQpt4XFiq3ZXTkMnEIW
         tzRHFW9fJxEfJKrDvXLL88qY0SpB6uh6I6q8XclyhJviqlcVYXxVmjfLHphuKKv1x1dE
         NgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTn8WBSY7M2H4mtI/FEvikiTl4j01+/HYt+NYEB11kG4T7Wxx/oWJH6ZmY4c7dO9ty3M+xf/e28VQROAQWGng9frnCvkWFS5FNRw==
X-Gm-Message-State: AOJu0YzgdOTGhkVkxHL5Iz3rnwTPq6xMicBR8KLugau9MPXFft6G10i0
	lAEC91zB+NNBTsxXzX+Lo/0sXHykGVuyRhPaXn53M80NmcK0vqSfbNVu6NrS0NfzT0ZR4q4UqXB
	r9Yd4SoHm
X-Google-Smtp-Source: AGHT+IHccyaS4DMMH+uijJ4CXkiSSJJSXPQ79x5SShd21cJ71QgNy+KD2SE4vhaG38euEUn2MJ0QHA==
X-Received: by 2002:a17:907:c245:b0:a6f:6ed6:1961 with SMTP id a640c23a62f3a-a6fab604e86mr453825566b.8.1718911948170;
        Thu, 20 Jun 2024 12:32:28 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf56d24esm2933266b.214.2024.06.20.12.32.27
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 12:32:27 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35f2d723ef0so992135f8f.1
        for <ath10k@lists.infradead.org>; Thu, 20 Jun 2024 12:32:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0WXUC8N3vYR/o3giw8RwewxIwW5SeK3uvt4lqfNYj5rmBea5m1bGbu0FXTUnvybP2KwYiskXs71uN1F9asaqT6441t3FYpGxgGQ==
X-Received: by 2002:a5d:6152:0:b0:35f:308a:cab0 with SMTP id
 ffacd0b85a97d-363170ecbe5mr4379764f8f.13.1718911595412; Thu, 20 Jun 2024
 12:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175703.605111-1-yury.norov@gmail.com> <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad>
In-Reply-To: <ZnR1tQN01kN97G_F@yury-ThinkPad>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2024 12:26:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
Message-ID: <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	"H. Peter Anvin" <hpa@zytor.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Borislav Petkov <bp@alien8.de>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Disseldorp <ddiss@suse.de>, 
	Edward Cree <ecree.xilinx@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Greenman <gregory.greenman@intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>, 
	Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Karsten Graul <kgraul@linux.ibm.com>, Karsten Keil <isdn@linux-pingi.de>, 
	Kees Cook <keescook@chromium.org>, Leon Romanovsky <leon@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Martin Habets <habetsm.xilinx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Neukum <oneukum@suse.com>, Paolo Abeni <pabeni@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ping-Ke Shih <pkshih@realtek.com>, Rich Felker <dalias@libc.org>, Rob Herring <robh@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shuai Xue <xueshuai@linux.alibaba.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wenjia Zhang <wenjia@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	GR-QLogic-Storage-Upstream@marvell.com, alsa-devel@alsa-project.org, 
	ath10k@lists.infradead.org, dmaengine@vger.kernel.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-net-drivers@amd.com, 
	linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mpi3mr-linuxdrv.pdl@broadcom.com, netdev@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bart Van Assche <bvanassche@acm.org>, Jan Kara <jack@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_123232_008121_06A3A425 
X-CRM114-Status: GOOD (  17.39  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, 20 Jun 2024 at 11:32, Yury Norov <yury.norov@gmail.com> wrote:
>
> Is that in master already? I didn't get any email, and I can't find
> anything related in the master branch.

It's 5d272dd1b343 ("cpumask: limit FORCE_NR_CPUS to just the UP case").

> > New rule: before you send some optimization, you need to have NUMBERS.
>
> I tried to underline that it's not a performance optimization at my
> best.

If it's not about performance, then it damn well shouldn't be 90%
inline functions in a header file.

If it's a helper function, it needs to be a real function elsewhere. Not this:

 include/linux/find_atomic.h                  | 324 +++++++++++++++++++

because either performance really matters, in which case you need to
show profiles, or performance doesn't matter, in which case it damn
well shouldn't have special cases for small bitsets that double the
size of the code.

              Linus

