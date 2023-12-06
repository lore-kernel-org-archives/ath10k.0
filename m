Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D05DC4167B
	for <ath10k@archiver.kernel.org>; Wed,  6 Dec 2023 05:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6huBbZbAII0X6eZV6S+b7knvK6KuHJo8Bh0bkLgUxxE=; b=hIBtWktXZq7zouLnUl4j31TW2x
	QewYSiiiKC269OFApj1yzy23AN3nfk5Q9kbSvYpfVLVxZbntNnO4Zz0pTKGu4FOB5bWKzMyylju/B
	PZoNulA6Bg8QTkFY26l54Jpln2qYazfW6fTZhl0dekdLXSiNBEwah20NhHMiYmRWjgbA4PMtkKVtS
	IsZXqHT4vS9DLe5BZDZEnvbvkDQYRbV10fr5dTqAb321dJOEj4y8iyE1TTMmtcEUY83Dji/qZdF8+
	gZl85Gql94KNJlNCVZtv1cZGNDX7CWTdQAk/GPLehQZCLY675X/XHbbcstz66taPqiqjP/yQimIki
	IRIz1iYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkPQ-0095sR-07;
	Wed, 06 Dec 2023 05:25:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkPN-0095rc-04;
	Wed, 06 Dec 2023 05:25:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6cc02e77a9cso6241060b3a.0;
        Tue, 05 Dec 2023 21:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701840315; x=1702445115; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6huBbZbAII0X6eZV6S+b7knvK6KuHJo8Bh0bkLgUxxE=;
        b=O9bR/yJK9U3tSw4v4VbuNR84Gpjk7v/dobfTCyRmIET7DPJ5Qat/bLggeRcqLNJmdM
         V5u5xk5AAg9E1FHby29Fi9ENAXxcGs+OKgGu2psl55JRB7pGh/uocpIYLyLZqcL89RxD
         rDfnwsgyn9twKGwNTrizyjYVt0ssRYd9H4LjHNMUhHPpJVXl+WbQdApyhdQKNJDYkcEB
         BPA/ZfAvQcXZ/FoKnJpeVYcQl0WGtJzUlr3TCMYmzhmaClQeQxajcWfU/gsian+DMnQn
         yvhQdWoVnA4vw94Xw2im1uFVrnCxTfBGiDwl0Ae+TIaiJMvhiz6wb4xIqOQeuy5mgsiV
         CfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701840315; x=1702445115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6huBbZbAII0X6eZV6S+b7knvK6KuHJo8Bh0bkLgUxxE=;
        b=ltfOeACXR4K14dfSxjtQMPSVIL2Vo311sUA/y6NipwknQCVFgeWEnz59QFbXgNmNgo
         xj3xQUH3KmUCz/5Rl9S8rmleU7GNVffXgAfD+h+9PKQsvs6A8qj5tVCgE9praHMfSG1w
         Y+OpLmHCptUvh4tXk+lAbfrqiLkRSWoQH8aVKribnE7zvFyUoLlHGIt3n/6yhI7QgqSc
         KhbaIUqKosC6+cFWxLDEzzlPIsyOtaj5BaTNwEoQssKeAzdfGwtdGx/2YZFyMyPzFSvN
         fA5mqWXCxN34uf4Q1V/HONC0PVWViyytOC2c5m1gv23y4z7cII3OefkgLdKv5GVTSB1W
         S2pg==
X-Gm-Message-State: AOJu0Yx3zUOJ1YES3AU9ddafYNjR8zQ/LoZ+oKT9OMDLg3ySfogA8pXx
	8xKltqBDqncwnD4HLcgorSk=
X-Google-Smtp-Source: AGHT+IFMxfqg8FxPkhbWeYw87iiXO3hRoVhFhH1xtCbWG3FZaVDEj9UfTpo1oYq4IqfLZ3ft2t7YHQ==
X-Received: by 2002:a05:6a00:98e:b0:6ce:6420:e174 with SMTP id u14-20020a056a00098e00b006ce6420e174mr407397pfg.36.1701840315262;
        Tue, 05 Dec 2023 21:25:15 -0800 (PST)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id ka32-20020a056a0093a000b006ce455a7faasm5350125pfb.150.2023.12.05.21.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 21:25:14 -0800 (PST)
Date: Tue, 5 Dec 2023 21:22:59 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Jan Kara <jack@suse.cz>
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
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 00/35] bitops: add atomic find_bit() operations
Message-ID: <ZXAFM2VZugdhM3oE@yury-ThinkPad>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231204185101.ddmkvsr2xxsmoh2u@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204185101.ddmkvsr2xxsmoh2u@quack3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_212517_135526_FBE8B04A 
X-CRM114-Status: GOOD (  39.43  )
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

On Mon, Dec 04, 2023 at 07:51:01PM +0100, Jan Kara wrote:
> Hello Yury!
> 
> On Sun 03-12-23 11:23:47, Yury Norov wrote:
> > Add helpers around test_and_{set,clear}_bit() that allow to search for
> > clear or set bits and flip them atomically.
> > 
> > The target patterns may look like this:
> > 
> > 	for (idx = 0; idx < nbits; idx++)
> > 		if (test_and_clear_bit(idx, bitmap))
> > 			do_something(idx);
> > 
> > Or like this:
> > 
> > 	do {
> > 		bit = find_first_bit(bitmap, nbits);
> > 		if (bit >= nbits)
> > 			return nbits;
> > 	} while (!test_and_clear_bit(bit, bitmap));
> > 	return bit;
> > 
> > In both cases, the opencoded loop may be converted to a single function
> > or iterator call. Correspondingly:
> > 
> > 	for_each_test_and_clear_bit(idx, bitmap, nbits)
> > 		do_something(idx);
> > 
> > Or:
> > 	return find_and_clear_bit(bitmap, nbits);
> 
> These are fine cleanups but they actually don't address the case that has
> triggered all these changes - namely the xarray use of find_next_bit() in
> xas_find_chunk().
> 
> ...
> > This series is a result of discussion [1]. All find_bit() functions imply
> > exclusive access to the bitmaps. However, KCSAN reports quite a number
> > of warnings related to find_bit() API. Some of them are not pointing
> > to real bugs because in many situations people intentionally allow
> > concurrent bitmap operations.
> > 
> > If so, find_bit() can be annotated such that KCSAN will ignore it:
> > 
> >         bit = data_race(find_first_bit(bitmap, nbits));
> 
> No, this is not a correct thing to do. If concurrent bitmap changes can
> happen, find_first_bit() as it is currently implemented isn't ever a safe
> choice because it can call __ffs(0) which is dangerous as you properly note
> above. I proposed adding READ_ONCE() into find_first_bit() / find_next_bit()
> implementation to fix this issue but you disliked that. So other option we
> have is adding find_first_bit() and find_next_bit() variants that take
> volatile 'addr' and we have to use these in code like xas_find_chunk()
> which cannot be converted to your new helpers.

Here is some examples when concurrent operations with plain find_bit()
are acceptable:

 - two threads running find_*_bit(): safe wrt ffs(0) and returns correct
   value, because underlying bitmap is unchanged;
 - find_next_bit() in parallel with set or clear_bit(), when modifying
   a bit prior to the start bit to search: safe and correct;
 - find_first_bit() in parallel with set_bit(): safe, but may return wrong
   bit number;
 - find_first_zero_bit() in parallel with clear_bit(): same as above.

In last 2 cases find_bit() may not return a correct bit number, but
it may be OK if caller requires any (not exactly first) set or clear
bit, correspondingly.

In such cases, KCSAN may be safely silenced.
 
> > This series addresses the other important case where people really need
> > atomic find ops. As the following patches show, the resulting code
> > looks safer and more verbose comparing to opencoded loops followed by
> > atomic bit flips.
> > 
> > In [1] Mirsad reported 2% slowdown in a single-thread search test when
> > switching find_bit() function to treat bitmaps as volatile arrays. On
> > the other hand, kernel robot in the same thread reported +3.7% to the
> > performance of will-it-scale.per_thread_ops test.
> 
> It was actually me who reported the regression here [2] but whatever :)
> 
> [2] https://lore.kernel.org/all/20231011150252.32737-1-jack@suse.cz

My apologize.

> > Assuming that our compilers are sane and generate better code against
> > properly annotated data, the above discrepancy doesn't look weird. When
> > running on non-volatile bitmaps, plain find_bit() outperforms atomic
> > find_and_bit(), and vice-versa.
> > 
> > So, all users of find_bit() API, where heavy concurrency is expected,
> > are encouraged to switch to atomic find_and_bit() as appropriate.
> 
> Well, all users where any concurrency can happen should switch. Otherwise
> they are prone to the (admittedly mostly theoretical) data race issue.
> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

