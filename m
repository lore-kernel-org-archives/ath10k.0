Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B648CC27C79
	for <ath10k@archiver.kernel.org>; Thu, 20 Jun 2024 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyF3zFimLRvnxw2fNLWvvt4TaZ4/tRThw/CSNxiuI4k=; b=hZdXh+hZEw1B4HzXsTODmLAzGD
	XsTblDYQfMCkXKOmt6l/ANspphlKRvBw+FaOZMlBd0JzUW2rKeBomdKZbDrBQi9a+p90oRNa6RTta
	B8UB4IVhGUHCX0gUV1kruIRN+dRCHDqItXUbpbx8/AD/EgJ3xS6yzaOgVLb8X894SxGmGBbl+ZuvI
	xR4eTOPWSYWPL2mPLBiRR96xNCpPDwQui/Q8hGZV0iFd19NX+owQjdRXBJImghLzKTxi4b0fc0pMb
	InbOUsGy9O5ThEk72FbcK4LrCiUlHWtIqAfscIdNyHwmfGoxrxIjtKRdYkoTdN0mhwlXZWK0KTsHN
	+uLXsQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKOGh-00000006ajM-3Hod;
	Thu, 20 Jun 2024 20:20:27 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKOGe-00000006ahc-1DRq;
	Thu, 20 Jun 2024 20:20:25 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6e57506bb2dso985618a12.0;
        Thu, 20 Jun 2024 13:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718914823; x=1719519623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyF3zFimLRvnxw2fNLWvvt4TaZ4/tRThw/CSNxiuI4k=;
        b=ZXXX3G37R+eLYgXxLGjKQhdkq+hQ455Xh5zM81sJfUDwC8Qkywo8e16iNLt5PYHG0D
         ZenuYQRXZLygvvB7dGu7GAV6+SM7D7ViMgMh+VcLLM2C6z0z51Eits32ytkh/rF7zEhA
         edBY3kYfKRZx+/YYapiCgWTD/uppbegYL54h9l/FtuniZNyLzyy7MOq/j8pVczY0T0hf
         q4v66CikQTFGf6dCh5Vmkz8c4QV2vBkdsQhLGYy4POvKBMU+Q9E2/jhKrTbF48NY8UoX
         YfWFQDW2Edf2fV2XeWi8jQZ/lpHmG7J09RyZ4Gq7TZDp2pOrcA7T5xrFXVxdD74D3PrX
         XVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718914823; x=1719519623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyF3zFimLRvnxw2fNLWvvt4TaZ4/tRThw/CSNxiuI4k=;
        b=PLJXnXG+H64yr1spbzT70JtWEUCuG2uc+4BrsWhb1E1zRgAqUucFnwOyCWKa8rSaPB
         d9Kems5+YcWIhVtXHVkEzRwDpyjA5Hq/W4cOc5ipqv2bGgxdej+Ebx0KVxloSQb7cXkK
         /cbTwixyYRTVmG29oFaXT+hbLbrusx8amrexjEYRa6cKUerEQ80wZ0wHtCI/co0XdoSD
         Tq/NBe9+XcvuX9lWie9a7Ohr2AkqeLA4t7INUlXtdEbTzW94LBTL7ZVpFH1aUHnijynK
         r448KNDrn9MPi3tssSZe+ZgglYUHbpMhyWEU+o9eWkp8rgz52l0dRn7w2AiY4W6BiEED
         9P6w==
X-Forwarded-Encrypted: i=1; AJvYcCUw5eNnGtAWO83dbuEos0MYOKaKg//FgK/oD+dMgcvH/2ALUCSnUhRk6lM4ahrZ0el0nHlubVF9sW4NvDMf/OMPPhHa257KV7SgQAot5JMhmbD3NZzyl0/OCMqIN084wTFES0yPeSS1uqPnoZD12+H7
X-Gm-Message-State: AOJu0YxH/D84ii/NjvFAkPcO8cuKW8sMdLCWWNu/edujGU1v+QPXMy09
	9Ix/WFp30lSUoXIXo6qwC7A/1HjES+m8RfxENqoKl1gyRuh++nUF
X-Google-Smtp-Source: AGHT+IHgTaUdNjnFlceuqDZQb86IcFDSmpZVDJyq9iZqJozpl3uONt9e5qvEXl/03kBUwqlpGmD+xQ==
X-Received: by 2002:a17:90b:3ec6:b0:2c7:e420:a0ec with SMTP id 98e67ed59e1d1-2c7e420a3f5mr3603638a91.0.1718914823251;
        Thu, 20 Jun 2024 13:20:23 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819dcc704sm81988a91.47.2024.06.20.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:20:22 -0700 (PDT)
Date: Thu, 20 Jun 2024 13:20:20 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Chaitanya Kulkarni <kch@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Disseldorp <ddiss@suse.de>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
	Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, Karsten Graul <kgraul@linux.ibm.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oliver Neukum <oneukum@suse.com>, Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ping-Ke Shih <pkshih@realtek.com>, Rich Felker <dalias@libc.org>,
	Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	GR-QLogic-Storage-Upstream@marvell.com, alsa-devel@alsa-project.org,
	ath10k@lists.infradead.org, dmaengine@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-net-drivers@amd.com, linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, mpi3mr-linuxdrv.pdl@broadcom.com,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
Message-ID: <ZnSPBFW5wL0D0b86@yury-ThinkPad>
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad>
 <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_132024_536432_99D8E197 
X-CRM114-Status: GOOD (  25.63  )
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

On Thu, Jun 20, 2024 at 12:26:18PM -0700, Linus Torvalds wrote:
> On Thu, 20 Jun 2024 at 11:32, Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Is that in master already? I didn't get any email, and I can't find
> > anything related in the master branch.
> 
> It's 5d272dd1b343 ("cpumask: limit FORCE_NR_CPUS to just the UP case").

FORCE_NR_CPUS helped to generate a better code for me back then. I'll
check again against the current kernel.

The 5d272dd1b343 is wrong. Limiting FORCE_NR_CPUS to UP case makes no
sense because in UP case nr_cpu_ids is already a compile-time macro:

#if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
#define nr_cpu_ids ((unsigned int)NR_CPUS)
#else
extern unsigned int nr_cpu_ids;
#endif

I use FORCE_NR_CPUS for my Rpi. (used, until I burnt it)

> > > New rule: before you send some optimization, you need to have NUMBERS.
> >
> > I tried to underline that it's not a performance optimization at my
> > best.
> 
> If it's not about performance, then it damn well shouldn't be 90%
> inline functions in a header file.
> 
> If it's a helper function, it needs to be a real function elsewhere. Not this:
> 
>  include/linux/find_atomic.h                  | 324 +++++++++++++++++++
> 
> because either performance really matters, in which case you need to
> show profiles, or performance doesn't matter, in which case it damn
> well shouldn't have special cases for small bitsets that double the
> size of the code.

This small_const_nbits() thing is a compile-time optimization for a
single-word bitmap with a compile-time length.

If the bitmap is longer, or nbits is not known at compile time, the
inline part goes away entirely at compile time.

In the other case, outline part goes away. So those converting from
find_bit() + test_and_set_bit() will see no new outline function
calls.

This inline + outline implementation is traditional for bitmaps, and
for some people it's important. For example, Sean Christopherson
explicitly asked to add a notice that converting to the new API will
still generate inline code. See patch #13.

