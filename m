Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2B5C433EF
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8o3OkfZJnQSgriROh0MP/dqYma/iUq+YARDnVCIS2F0=; b=NUpQxEegZGWccN
	Do83vLBH3LKM1oZ1aty3Hgnan6hOVhKW7vOH6f1RtZMPX0Tl5C+WonCwEK0j9U7GWhzFkKrD3k3fU
	H0FwhASxJHuY8x3hWdAWZnY0q9Hg/j4Yr/HYMFYOwQKM8tWISfxQtb+jmBf8+vxXGSnQx929kht/I
	PwOR5xK8g5wQ90JR+PEJbOCbRaO1SR8u/ezX3AgFQ2NgXF2950d4uU0GPEbRhwzmVRq4hcp/eIUpZ
	iU5y6HO3WlejQ/zIkZWzGF+lJfkm5ItlascX6dReYzQJ/ItuHCweDedRqiwiFcp8HkYMwHD9at9b5
	3Dxyh5vrNZSgIcs3ayPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNIBE-001shn-JU; Thu, 24 Feb 2022 17:45:28 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNIBB-001sgf-WA
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 17:45:27 +0000
Received: by mail-lf1-x133.google.com with SMTP id g39so5154129lfv.10
 for <ath10k@lists.infradead.org>; Thu, 24 Feb 2022 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pOBmVUTfu7dJw7T0At09LeWpqEdb7Gx94oz8UfcdCXs=;
 b=AILmembZ985YYL0f4wZ5s11RyKgR5u6qiQrV7RZNkT9G5n/SUdL4Vhrq9B5bX8IAIQ
 Y6nGnLQuOzkqFVDrilbDkVYSx1GL7mMY7i0oqQFQ167eDMte/SkF8KYTQPuW8ZBUYD0I
 S+wsm+vFqKevBhVyTZaq6iuYgrlCFfQmfxWN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pOBmVUTfu7dJw7T0At09LeWpqEdb7Gx94oz8UfcdCXs=;
 b=lY2RH8XSjqY3NSXZs1oYADIo+1AEOGIFmpRp+G5CI9MT+e0W1jCYA/6BxuGsakWlAR
 dxVRlvlgxTa/QxH5KG5ye4cFZ44f0XNQctRDi2l6sgrCJgcyreJpIWaioIflkIiQGs32
 DUtvoRbJtH89PmDl5L1uFk+1/4rY0245XYAxtM5XkP3f3/n3WcBwdFtRj5WAw7V5pmU7
 PmcbRqzniK94VX7zmDnDb3RBjLw7u9EO4KGaANgzZGRugBZv0iuL+u+C5cHxqvH+K5YE
 8PEkZaBm1ttKoOfdf5LYgL04F9lML6mvGG9D2udxtMCzuo5GA/2RH3OM9z3glr/gqfom
 AjBA==
X-Gm-Message-State: AOAM531Q2Ziqdee7+QMYPRMmOSroSvWnSwdL3bHe5JofCl28kxkoVq0G
 lD2ASNPj8auOHOQ9FuZEhRG3YL2Tb7JqX6oywFI=
X-Google-Smtp-Source: ABdhPJx4xc77diqy+dlLtagSec9FgPgG14uyKZmk9IUwRaC2SxWflY5MWWXWnhISnDKACNJ4+nMiGw==
X-Received: by 2002:ac2:54b2:0:b0:443:fbec:ef0d with SMTP id
 w18-20020ac254b2000000b00443fbecef0dmr2440452lfk.343.1645724724070; 
 Thu, 24 Feb 2022 09:45:24 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id c12sm256336lfr.234.2022.02.24.09.45.22
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 09:45:23 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id v22so3976836ljh.7
 for <ath10k@lists.infradead.org>; Thu, 24 Feb 2022 09:45:22 -0800 (PST)
X-Received: by 2002:a2e:80c6:0:b0:246:3334:9778 with SMTP id
 r6-20020a2e80c6000000b0024633349778mr2640059ljg.443.1645724721879; Thu, 24
 Feb 2022 09:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20220221122638.7971-1-franciman12@gmail.com>
 <e32de43c-e00a-5766-e988-fe192d36d719@quicinc.com>
 <CAH4F6utmtAM3CzX2_Fbn94Sb-X8m0patPh8yWwbuBB0t1VYH=g@mail.gmail.com>
 <87o82wvhtk.fsf@kernel.org> <20220224075346.GL3943@kadam>
 <87fso8vb3w.fsf_-_@kernel.org>
In-Reply-To: <87fso8vb3w.fsf_-_@kernel.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 24 Feb 2022 09:45:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whFKYMrF6euVvziW+drw7-yi1pYdf=uccnzJ8k09DoTXA@mail.gmail.com>
Message-ID: <CAHk-=whFKYMrF6euVvziW+drw7-yi1pYdf=uccnzJ8k09DoTXA@mail.gmail.com>
Subject: Re: Use of void pointer arithmetic?
To: Kalle Valo <kvalo@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Francesco Magliocca <franciman12@gmail.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org, 
 rmanohar@qti.qualcomm.com, linux-wireless <linux-wireless@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_094526_059680_D2CE9754 
X-CRM114-Status: GOOD (  17.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, Feb 24, 2022 at 1:59 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> > What does -Wpointer-arith buy us?
>
> A good question. I have always just thought we should avoid void pointer
> arithmetic due to the C standard, but now that you mention it void
> pointers can indeed simplify the code. So I'm not so sure anymore.
>
> Any opinions? Is there a kernel wide recommendation for this?

We consciously use arithmetic on 'void *' in some places, although
it's not exactly _hugely_ common.

It's much more common to turn a pointer into an 'unsigned long' and
then doing basic operations on that.

The advantage of 'void *' is that it does avoid the need to cast the
pointer back.

But at the same time it will never replace the 'cast to an actual
integer type', because the 'void *' arithmetic only does simple
addition and subtraction, and many pointer operations need more (ie
alignment needs to do the bitops).

So I think it's mostly a personal preference. I *do* think that doing
arithmetic on 'void *' is generally superior to doing it the
old-fashioned C way on 'char *' - unless, of course, 'char *' is
simply the native type in question.

So if 'char *' casts (and casting back) is the alternative, then by
all means use 'void *' as a kind of generic and type-independent "byte
pointer". That is how it is meant to be used in the gcc extension.

And no, nobody should ever use -Wpointer-arith on the kernel in
general. Our use of it is not _hugely_ common, but it's does exist,
and it's not really frowned upon.

                    Linus

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
