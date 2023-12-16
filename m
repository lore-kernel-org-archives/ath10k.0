Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F35C46CA2
	for <ath10k@archiver.kernel.org>; Sat, 16 Dec 2023 21:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUQpZPD/c05+/8BhIN1J/cQeLxUmIOzSz7QCay9VzCE=; b=GKoqctLuX8CKAUlvlrvAkUZ/jX
	8ro3yheO69CbENyxNaX+QXgDQqKauM7XGpD9xMUBFIq4zEDMiAsf+6717pG/KJZjh2qgdspieNPfx
	LQegbuP9IkU2awog0xD6LB/9SiFLFKAx39Vle6WZwZXxjsKb4sHksbTXiOC/K/icXuC8OlFsNWj0O
	Z8kM/WyN84rJz9wBeNzZRUT3FQdrdBZcG60VfzNUiYJeE/iBDnAj4fhK8pqZ/tDp0g/3qa8sYNZ5q
	bsy62/VychuC2YuFIKWfwvCsxX7dP7d3rJHHLQu6ohUs3lzbScwQ4ulsWHegxRiNo7z9r26rrKh+F
	9snq0oUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEcWI-006lUO-0c;
	Sat, 16 Dec 2023 21:48:26 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEcWE-006lTO-1v;
	Sat, 16 Dec 2023 21:48:24 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d9fdbcec6eso1498757a34.1;
        Sat, 16 Dec 2023 13:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702763300; x=1703368100; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NUQpZPD/c05+/8BhIN1J/cQeLxUmIOzSz7QCay9VzCE=;
        b=UBF+zPakrOwpU0T6fo2HPp3H50i5wqFv6141YtyaXd+jvE8Wl4sJF868rOAt4byX9o
         tt8oq2DjLBX+5CSB3I/3n2lCe+NQUAiVOllV2ztX3YmWGElFhXMJy5Ap/PD0t026uMPM
         x+TCsHgHJybA/RGPydNpiKGZDPT4GRihX6p1fUKaMqhb1xtNp2xoRh0mlEuaDX9KCV1+
         Mu3GGVK7Dt/HoXE90+TA79OFuTrNBUso4ac74hm1csLolJUJCRSe4t6lAcVrnXHqtcrw
         VIuTuCPJ4r3JBZmLTlpGoZLFXYYTrYByIAkfSxbGqSXB+/6bqlo9a1cWGJ5ZhUmVD3An
         psBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702763300; x=1703368100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUQpZPD/c05+/8BhIN1J/cQeLxUmIOzSz7QCay9VzCE=;
        b=Vf4Yo8r7J9Wdx74X5Nh/F6ei2EI5Xzf+vo5b37TMz0Ygtg9LQxY7nSkS9SFUkvKcgo
         PIvJZZbTi6oL15lDAFY/q2iT7n0wSXy5Jb7zd5fYbWHF7utPxWYOOJLmHRsOVd2ZT2a5
         ++rcMGV+bhzco7DcCNJgvXkEbpP4z3XpO35gpsIYjcajnUPijDoGg5RAITzQrCWs+CKb
         obLOeRlc2rPJag8Bk0S2NueLPAm0et9SRG0xZ4dF4onH79un8MFw0h2H8PoNDhqKmdxg
         MsixWZUB6Gmwdh13gIEeFPpNb1f2Kr/uTUmXsesvZxaapK7dR2I2hQIosfQBdKtGC9Oe
         oCrA==
X-Gm-Message-State: AOJu0Yw2VU6ybIA02ozX6qs+88Qectma0qt+wReXievPlUbFicel8wI+
	93hzjQ0s92bmyn3cLO6fkD8=
X-Google-Smtp-Source: AGHT+IFAZquuH097Av+/ztaIvHAct5BHBdf+5D2NTKxYyfNfNcV2HR26lQ0bCSd6CXKBysIoEd8l8w==
X-Received: by 2002:a05:6808:1819:b0:3b8:b063:6658 with SMTP id bh25-20020a056808181900b003b8b0636658mr13429212oib.79.1702763299744;
        Sat, 16 Dec 2023 13:48:19 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:4a5e:2f67:f6d1:4a98])
        by smtp.gmail.com with ESMTPSA id l6-20020a25bcc6000000b00dbd22a3eb4fsm60955ybm.51.2023.12.16.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 13:48:19 -0800 (PST)
Date: Sat, 16 Dec 2023 13:48:18 -0800
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
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
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Cc: Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v3 00/35] bitops: add atomic find_bit() operations
Message-ID: <ZX4bIisLzpW8c4WM@yury-ThinkPad>
References: <20231212022749.625238-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_134822_634288_1C7A0D5A 
X-CRM114-Status: GOOD (  40.24  )
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

On Mon, Dec 11, 2023 at 06:27:14PM -0800, Yury Norov wrote:
> Add helpers around test_and_{set,clear}_bit() that allow to search for
> clear or set bits and flip them atomically.
> 
> The target patterns may look like this:
> 
> 	for (idx = 0; idx < nbits; idx++)
> 		if (test_and_clear_bit(idx, bitmap))
> 			do_something(idx);
> 
> Or like this:
> 
> 	do {
> 		bit = find_first_bit(bitmap, nbits);
> 		if (bit >= nbits)
> 			return nbits;
> 	} while (!test_and_clear_bit(bit, bitmap));
> 	return bit;
> 
> In both cases, the opencoded loop may be converted to a single function
> or iterator call. Correspondingly:
> 
> 	for_each_test_and_clear_bit(idx, bitmap, nbits)
> 		do_something(idx);
> 
> Or:
> 	return find_and_clear_bit(bitmap, nbits);
> 
> Obviously, the less routine code people have to write themself, the
> less probability to make a mistake.
> 
> Those are not only handy helpers but also resolve a non-trivial
> issue of using non-atomic find_bit() together with atomic
> test_and_{set,clear)_bit().
> 
> The trick is that find_bit() implies that the bitmap is a regular
> non-volatile piece of memory, and compiler is allowed to use such
> optimization techniques like re-fetching memory instead of caching it.
> 
> For example, find_first_bit() is implemented like this:
> 
>       for (idx = 0; idx * BITS_PER_LONG < sz; idx++) {
>               val = addr[idx];
>               if (val) {
>                       sz = min(idx * BITS_PER_LONG + __ffs(val), sz);
>                       break;
>               }
>       }
> 
> On register-memory architectures, like x86, compiler may decide to
> access memory twice - first time to compare against 0, and second time
> to fetch its value to pass it to __ffs().
> 
> When running find_first_bit() on volatile memory, the memory may get
> changed in-between, and for instance, it may lead to passing 0 to
> __ffs(), which is undefined. This is a potentially dangerous call.
> 
> find_and_clear_bit() as a wrapper around test_and_clear_bit()
> naturally treats underlying bitmap as a volatile memory and prevents
> compiler from such optimizations.
> 
> Now that KCSAN is catching exactly this type of situations and warns on
> undercover memory modifications. We can use it to reveal improper usage
> of find_bit(), and convert it to atomic find_and_*_bit() as appropriate.
> 
> In some cases concurrent operations with plain find_bit() are acceptable.
> For example:
> 
>  - two threads running find_*_bit(): safe wrt ffs(0) and returns correct
>    value, because underlying bitmap is unchanged;
>  - find_next_bit() in parallel with set or clear_bit(), when modifying
>    a bit prior to the start bit to search: safe and correct;
>  - find_first_bit() in parallel with set_bit(): safe, but may return wrong
>    bit number;
>  - find_first_zero_bit() in parallel with clear_bit(): same as above.
> 
> In last 2 cases find_bit() may not return a correct bit number, but
> it may be OK if caller requires any (not exactly the first) set or clear
> bit, correspondingly.
> 
> In such cases, KCSAN may be safely silenced with data_race(). But in most
> cases where KCSAN detects concurrency people should carefully review their
> code and likely protect critical sections or switch to atomic
> find_and_bit(), as appropriate.
> 
> The 1st patch of the series adds the following atomic primitives:
> 
> 	find_and_set_bit(addr, nbits);
> 	find_and_set_next_bit(addr, nbits, start);
> 	...
> 
> Here find_and_{set,clear} part refers to the corresponding
> test_and_{set,clear}_bit function. Suffixes like _wrap or _lock
> derive their semantics from corresponding find() or test() functions.
> 
> For brevity, the naming omits the fact that we search for zero bit in
> find_and_set, and correspondingly search for set bit in find_and_clear
> functions.
> 
> The patch also adds iterators with atomic semantics, like
> for_each_test_and_set_bit(). Here, the naming rule is to simply prefix
> corresponding atomic operation with 'for_each'.
> 
> In [1] Jan reported 2% slowdown in a single-thread search test when
> switching find_bit() function to treat bitmaps as volatile arrays. On
> the other hand, kernel robot in the same thread reported +3.7% to the
> performance of will-it-scale.per_thread_ops test.
> 
> Assuming that our compilers are sane and generate better code against
> properly annotated data, the above discrepancy doesn't look weird. When
> running on non-volatile bitmaps, plain find_bit() outperforms atomic
> find_and_bit(), and vice-versa.
> 
> So, all users of find_bit() API, where heavy concurrency is expected,
> are encouraged to switch to atomic find_and_bit() as appropriate.
> 
> The 1st patch of this series adds atomic find_and_bit() API, 2nd adds
> a basic test for new API, and all the following patches spread it over
> the kernel.
> 
> They can be applied separately from each other on per-subsystems basis,
> or I can pull them in bitmap tree, as appropriate.
> 
> [1] https://lore.kernel.org/lkml/634f5fdf-e236-42cf-be8d-48a581c21660@alu.unizg.hr/T/#m3e7341eb3571753f3acf8fe166f3fb5b2c12e615
 
Thank you all for reviews and comments. Now moving the series to
bitmap-for-next for testing.

Thanks,
Yury

