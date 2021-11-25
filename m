Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A1EC433F5
	for <ath10k@archiver.kernel.org>; Thu, 25 Nov 2021 00:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeF/iC+7GGh/msro5cYbxVlKGE7f9PwaT7VZLuIuHZw=; b=Vbq9ygMWnYJ+QA
	X+od3fKIQxkLX9S9Hx6n+0s0R0XSInbIqnC6eVJ3eMfhG9nnEuIWlmmiPJoKN1ulP2kQkZhhVnRg5
	Iq6SS8VoE9RWkHdHUcdZME7butO/axGlX3etlvlu4zLIIJrGOf/PlP6k9oCUpjssdyreVh7/iwdXP
	0aNyQB7CAU1OTHrTBj7Kmp0Jlfs87DYjzAzzLzZxcpyFYCcn+arSfqUlXkRW9T5ZFF9gOmDpu2akc
	vbCmGKfalx4zrvRSMaYSVUTsARFYzlQUabH+EMthkng/c9y8gxn1tlfdXhGnz74HTsC5tQLfG8k+i
	WDF9zNNKPwYF9qlq3OOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq2ub-006A8m-5m; Thu, 25 Nov 2021 00:46:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq2uY-006A8R-GM
 for ath10k@lists.infradead.org; Thu, 25 Nov 2021 00:46:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC6F9610C8;
 Thu, 25 Nov 2021 00:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637801210;
 bh=x+Irm6BBVdjUP/y8Y6kPW6Nbe6aQsnPfkWZ4NsriQUY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RDzYWH6LBtXYm7prrirggR9VskCFOFpiEnEPAm+Liy0TDI6gtCo6jd8us2Mv+gpFM
 zGom5nHuoiGDm5CFocYNteKtZ4XtKfc/QgG+zuoJJ1V+ksgUyQZqN4xAdOTD+Ftrsd
 d5XrvAsFeWoHf2ul4LVxVOLyas8EVPuOO8LD8QiZ5QHFZuAxyXFr4D9z5/HXuu3zPO
 inPSzf6mDg6Mc1N7hpQr7jcyaQaVNGVZ4zQboP5iSJybuzil/CzPh1kHuJ5laNC2mm
 kefbv9pQmXPPVLkl5/eB1oNn7FSnaQ+3Kx5EWHEmtD4uFUVIOIgYzx7Ge3W/BjPOGa
 G/vaXhxDqLqsg==
Date: Wed, 24 Nov 2021 16:46:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, ath10k@lists.infradead.org, Heiner Kallweit
 <hkallweit1@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [Bug 215129] New: Linux kernel hangs during power down
Message-ID: <20211124164648.43c354f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211124144505.31e15716@hermes.local>
References: <20211124144505.31e15716@hermes.local>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_164650_620564_1A4BDE41 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

Adding Kalle and Hainer.

On Wed, 24 Nov 2021 14:45:05 -0800 Stephen Hemminger wrote:
> Begin forwarded message:
> 
> Date: Wed, 24 Nov 2021 21:14:53 +0000
> From: bugzilla-daemon@bugzilla.kernel.org
> To: stephen@networkplumber.org
> Subject: [Bug 215129] New: Linux kernel hangs during power down
> 
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215129
> 
>             Bug ID: 215129
>            Summary: Linux kernel hangs during power down
>            Product: Networking
>            Version: 2.5
>     Kernel Version: 5.15
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Other
>           Assignee: stephen@networkplumber.org
>           Reporter: martin.stolpe@gmail.com
>         Regression: No
> 
> Created attachment 299703
>   --> https://bugzilla.kernel.org/attachment.cgi?id=299703&action=edit    
> Kernel log after timeout occured
> 
> On my system the kernel is waiting for a task during shutdown which doesn't
> complete.
> 
> The commit which causes this behavior is:
> [f32a213765739f2a1db319346799f130a3d08820] ethtool: runtime-resume netdev
> parent before ethtool ioctl ops
> 
> This bug causes also that the system gets unresponsive after starting Steam:
> https://steamcommunity.com/app/221410/discussions/2/3194736442566303600/
> 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
