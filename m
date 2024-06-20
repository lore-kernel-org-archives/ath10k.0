Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE233C27C79
	for <ath10k@archiver.kernel.org>; Thu, 20 Jun 2024 18:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iVi8v7MOsNpmY/+YQC9/JqsYXXSSMQtfI1oW5IIrXg=; b=XsclruXCxG4ZFIguIvRPttlZeI
	qtzZLcYXtzomNEdjrKwyrTmx1axXz8WpZJrYVzttgPjgUUnbFzW66GKtcEDjeODSvvNz1D25/H/Jy
	58iggWAKUTs8/qmhYAqKIyZm007LFGXcGtXBBUUEHyiM3as5b+GdzQOG+iPE7kQgmG/S9tuOBbcem
	N6XiN0aWEcO2KSeZoftj647cmkk5mcH7ZHYmYcDPf9hxHhqE/c/8sAzMBW5udVX3PPeBOjh/PHjeT
	dJKBxTax9POUC3iX+QH7UelYiMxY95HbEO7D1QLv2qFWMxH1BVuBzGuXl0giaKAcm8dHcjB6ZfE5z
	7h3qaj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKMaC-00000006JhJ-1veG;
	Thu, 20 Jun 2024 18:32:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKMa9-00000006JgC-2ZwY;
	Thu, 20 Jun 2024 18:32:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f6fabe9da3so10114435ad.0;
        Thu, 20 Jun 2024 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718908345; x=1719513145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8iVi8v7MOsNpmY/+YQC9/JqsYXXSSMQtfI1oW5IIrXg=;
        b=K9m7xc0vsfATz6KTeZogq7zonYsP9tzqyoMnux8jPqldwgio1hZPH+Vk5ju2TGYDV+
         A9og4/f5FnNMByNzST4nhbFfDT/JcdeWyJKftmbOE9ZY9txVw3bH+WN7xRN7VEBPRrS+
         07dc5naspa9pV46MN3MvxaA0ahm6v05qxeN87dUJAWaK9dmnxUPwLQHOAKFSaMzmpwIv
         LYVe3hiwZi71j/lhHoM7JlqS2r6SYFdYmEAU50bn7RdkvqJfjP1Flsvp9O2PxTjhKmDv
         f6T2bqWrb3+6985oNb9oACwRkVfw9rVnufMge5z3D+BmiJa+sTNY567t259o7fFiAjml
         fazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718908345; x=1719513145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iVi8v7MOsNpmY/+YQC9/JqsYXXSSMQtfI1oW5IIrXg=;
        b=pZa7WNy6NZGWg7//jQ3YiQC9zqvEOyqb9q9be4dRrL8AVRgSSWoqcpwJlI8l4sR262
         RfwpnGvc7gOd7ueRQ5iR5z5kDgHNwhY+D9m+Ra0KQptuVz/5dFJ5J3tOzdAHum0HFz4N
         /h8U0GG+dXRMCle0M7wPi1IJzADKHitTKSPLzIYY9dMwENoQmfXETwAFWiMcGqFYayy6
         OL5MYkcWDqABxSzejlvPuIUxZ2vlv7MCbOwIpbZal5U3fh7NZ8I5ySLJqO8XXH+VBJsK
         ngqzsxAjR6bzUZA1oCilTGZwDPO8CVlFGesv5wR187QCf1CViAL0WMxxG/PaN7glSPs5
         l+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoLLIzMvcAI1WO8tL5Aft+8Y63Zm+l+6eJh0ds6xQqR6zphJSm5Lj/SAhFTutz1gWk6JoUN5wUJIpuCC0rmi6G+qXurRbNhR+eKpEyDKFkmD/i7oYrMhyTpL8zovmbt13lYkQwNq4Cr0omUWvPksrW
X-Gm-Message-State: AOJu0YxsENOMMGDirAPIcYT4N2GsfxVKjrz8sypxkpIVPpWj6NdMOicG
	+r88QrvEobvWFzSdTqH2DU/EriYD8r51n7K53rqoAPutsznhojA0
X-Google-Smtp-Source: AGHT+IGwYt1/AWmTgUMNjVMcs2dgiLwPkNhT8ZohuoeI/pLSbMfw85UksxqJbsocMe0+kY+O1HneTA==
X-Received: by 2002:a17:903:230c:b0:1f9:bb35:f313 with SMTP id d9443c01a7336-1f9bb35f5b7mr46779535ad.30.1718908344747;
        Thu, 20 Jun 2024 11:32:24 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e80ef6sm140498555ad.115.2024.06.20.11.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:32:23 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:32:21 -0700
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
Message-ID: <ZnR1tQN01kN97G_F@yury-ThinkPad>
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_113225_692395_D2247015 
X-CRM114-Status: GOOD (  23.51  )
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

On Thu, Jun 20, 2024 at 11:00:38AM -0700, Linus Torvalds wrote:
> On Thu, 20 Jun 2024 at 10:57, Yury Norov <yury.norov@gmail.com> wrote:
> >
> >
> > The typical lock-protected bit allocation may look like this:
> 
> If it looks like this, then nobody cares. Clearly the user in question
> never actually cared about performance, and you SHOULD NOT then say
> "let's optimize this that nobody cares about":.
> 
> Yury, I spend an inordinate amount of time just double-checking your
> patches. I ended up having to basically undo one of them just days
> ago.

Is that in master already? I didn't get any email, and I can't find
anything related in the master branch.

> New rule: before you send some optimization, you need to have NUMBERS.

I tried to underline that it's not a performance optimization at my
best. People notice some performance differences, but it's ~3%, no
more.

> Some kind of "look, this code is visible in profiles, so we actually care".

The original motivation comes from a KCSAN report, so it's already
visible in profiles. See [1] in cover letter. This series doesn't fix
that particular issue, but it adds tooling that allow people to search
and acquire bits in bitmaps without firing KCSAN warnings.

This series fixes one real bug in the codebase - see #33, and
simplifies bitmaps usage in many other places. Many people like
it, and acked the patches.

Again, this is NOT a performance series.

Thanks,
Yury

> Because without numbers, I'm just not going to pull anything from you.
> These insane inlines for things that don't matter need to stop.
> 
> And if they *DO* matter, you need to show that they matter.
> 
>                Linus

