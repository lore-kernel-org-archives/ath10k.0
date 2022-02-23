Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505F2C433F5
	for <ath10k@archiver.kernel.org>; Wed, 23 Feb 2022 19:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1v2ABxSm4fpN/ei29mQpxMz8jOBndHk0Tc3O9FHwP0=; b=1SVPCFXnSFENrA
	MR4qkJWqk3oICIvvhwIaSqZSf+waRN9YfZXO7ItmH5DL6kkps7+JDugVLgt75CAtleAcBSSWaJABz
	BjuaCpbRabu5gk/C4HiDNTOz/e54wQeincUlPzTv9xf9BZ5xPN7DbDiCOJ41bkfNNtCCFgr2innzr
	bjQZ7RcQy4uGsYpOl0pyr3VVzKkMOG51pqNozEC2dNLOy2GTiNYrK+jcmZb3fF9Zna6ovxWfoAFe0
	MrlXgMKJU5S6rzrmsWQFe8YVPvJ7itsGzksLTfYWjsqhKIuTKyOA0EBajkrK/CwFYKMQOmauUkyZN
	fM1o/oX5Gx7k1v8YF8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMxhg-00Fvvn-DQ; Wed, 23 Feb 2022 19:53:36 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMxhZ-00FvsV-VA
 for ath10k@lists.infradead.org; Wed, 23 Feb 2022 19:53:32 +0000
Received: by mail-ed1-x533.google.com with SMTP id q17so46166444edd.4
 for <ath10k@lists.infradead.org>; Wed, 23 Feb 2022 11:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8xzIGRU7kgoNeqVJnT8FATGaLbwx79ZTsDVZkuP2gs=;
 b=qdzB9qkHu5Fqj1kx7Uk8iIpRvh9/yilmi3JSZV9pzqOorUhxfYQjlxJ/B5zoZsSJjX
 i0yzFNHyn2C4m9VdRSgRV4s4L4NvPYYLwZ5Mmyt0GMLi4ddzx2YQjFXaGCP79zH140Ws
 LwSSQBZi7/hqXrfpCGwGx4bTOqjq/pesoojtEPWZ1IPvVneKRq+QGvLxlYoxsG73fjpM
 3AVJngaySr5EKTCOg3AT9Ih67v3/XVOoaA8dcvoaP0sT18Cf/6j3t6OSd/oql4MchLGg
 6KPE/J9b5/sOmKZB18qwZqBhv9KRhtI8XsD2AX0kCnSs71OHHjheoXpD9pf6yJgB4CRP
 7tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8xzIGRU7kgoNeqVJnT8FATGaLbwx79ZTsDVZkuP2gs=;
 b=Reov8Iq4isEdtIdD9o40zratIzcNih5SnCvKs/8TZTntECm7zOiVp3aw4r/sBkLJ46
 5LB22sDL73OmbrLhP+hTAsLfYHSXT7DqX4QcUeM5gLEeYK887RJ7//LdA5Tqvj3q8KJM
 PyonbscJsQeDKyUO3Y7v2ToQXXACsUbfo3vgGskVGU5h8J/Rx9g1Jab7Kx1bm5nx+i1c
 w78Q7ruwN+rbmmrCpa9uDY10mds5DVCzwxRN1px5pd28rLCUhP5SWO7smdrJOFkofeZI
 Mr+NcIDEZQCrgZr47p6AR5iqRNz6Fh3NZr8gzFC/rjWnl/cignzmbThcH8baBQt0V1Sk
 3CDA==
X-Gm-Message-State: AOAM532q2Irk60LxXwPQkiR8juY3fEOQh71V3OmS+TF2RYYDGxRrgXgp
 dikA5gyAb5owpG8Sj7Cb7xkwmwAul0M=
X-Google-Smtp-Source: ABdhPJz7kPnqf8g2i/3K+Ps1h79nfwS0NaVYkocDPnQ39mbS2BvHcRXrW3DhroR155FY+0njItw0lg==
X-Received: by 2002:a05:6402:c90:b0:410:a0a7:ca5b with SMTP id
 cm16-20020a0564020c9000b00410a0a7ca5bmr926393edb.417.1645646006127; 
 Wed, 23 Feb 2022 11:53:26 -0800 (PST)
Received: from debian64.daheim (p5b0d779b.dip0.t-ipconnect.de. [91.13.119.155])
 by smtp.gmail.com with ESMTPSA id m7sm304676eds.104.2022.02.23.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:53:24 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1nMxhT-001RgQ-V8;
 Wed, 23 Feb 2022 20:53:23 +0100
From: Christian Lamparter <chunkeey@gmail.com>
To: linux-firmware@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH v2 2/5] ath10k: QCA9888 hw2.0: update board-2.bin
Date: Wed, 23 Feb 2022 20:53:20 +0100
Message-Id: <63972ee8daa620c57eda5eb89221ecfeb55f46af.1645645875.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_115330_037595_83F5B1DC 
X-CRM114-Status: UNSURE (   9.28  )
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

syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
<https://github.com/kvalo/ath10k-firmware/tree/master/QCA9888/hw2.0>

Includes the following changes:
085c231 ath10k-firmware: QCA9888 hw2.0: Add Plasma Cloud PA2200 specific BDFs
4965bc7 ath10k-firmware: QCA9888 hw2.0: Add EnGenius EMR5000 specific BDFs
7ac0eb3 ath10k-firmware: QCA9888 hw2.0: Add EnGenius EAP2200 specific BDFs
75d699b ath10k-firmware: QCA9888 hw2.0: Update OpenMesh A62 specific BDFs

Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
v1->v2: sent to linux-wireless + ath10k mailing list too (Valo)
---
 ath10k/QCA9888/hw2.0/board-2.bin | Bin 84928 -> 121384 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/ath10k/QCA9888/hw2.0/board-2.bin b/ath10k/QCA9888/hw2.0/board-2.bin
index 3038e97b4809cf976644ecd8833d69e865ac0b29..007c82f5ba5b82726e842d0329ffa379711e8014 100644
GIT binary patch
delta 4376
zcmX>wopr?)_J%Et&9aP~(_3U2%NZFaZ(uCko-4-~tUGZ63ul2o0~pv%Pn2Oalyl8<
zPtD6LE!K5)3@|b>Fv!hi1WGFa6)EV?bJ@N`hB2IR@_NQ1kO6x+C*R|~z_@7hdY%_d
z+aGH)&gJE1X6NMQ<rfqd6_=dMXfHZBURGiH0ZT>&mIWOJ0h4FQ%1pCj+%)-=oZ03%
zavm)8N=ga}a&j^<Qc?rLsvjteq4w4fpx;4Gs2|wim#H71c!xzhD>&(GPV|#u+J45F
zaUP?Uf{Kco0ub1s12ruz9W@|87q^j;lT(lag2{@SF;+lY0t7Hr0gaRc0SpNd5fLE}
znEXz&uO4K(l9CdpDk@5VJffkYp@QKODLD%{1sNF`Ovi(~h*tvW_nW}D#Nl@;O5h1b
z3rIL(cncQ5I3=d@doo5k$f&8wz?2}fm2`A;VB%s53Szj}z#s^4K#qE3Hge2^oCz}o
zojv)DuAP*O3`kl@2}Fv4?Sqk%FUsjDKoS=uC5ecD6d{u~Hq-BUG0IGSCwB^W(e4{$
zYJgg_JJ_Qa?VIm$?_?&SP;c2BQ1OLnvyS2p#(Fh16%_?wijk5U5EiIZ9}tV7_SO%e
z-$72Or$g}LtF8ySR2K!8>Iw{kj9Zv<xMYCz9RF%bU@6Z7E#+AjEm^W?a-p0k%ZgR2
zR)85`5k<`et65M0%2+610TiGJf;h9JAX-2rILiW<$ygamV7r#VEXAs35wIk=TaVKj
zRFuH&qgfUZYcTx^wH~JgxG=Sww+x{GnZ0BUc5!4i^OgYvAZVH!BMV&Z93X&k76Ac_
zJq-wOu|Y+tJVX~nJ%o)y0%JpyeHK_~!Sq@$M)B!=UW{zhA9*nfO)l`e053otAZ_D-
zoW$bXMCY9R(iGhQM^Ni{v~5hg2JC3tcwqWOz#0TxxR17tZ4h9zZ43*GVbL}|1^{vw
BR%-wN

delta 28
kcmZ3nh5f*E)`l&N&9c*f`!H58a!%gBShzh`jxksl0H~@8ZU6uP

-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
