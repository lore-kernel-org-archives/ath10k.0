Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4208C4332F
	for <ath10k@archiver.kernel.org>; Fri, 16 Dec 2022 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5o8fJyDbmGDfHERlSFvrqFGdzbR5Sg2c4HflZw4vZ8=; b=AvVge9V9vj3SdY
	12dt+SwFIdEUWC4nk/LpHTnasnzT3I3XWgwAN33qtRuKijcJ417I2BH6uN2W7h1D9m1BvVQZVIepy
	v34z2iIPwAjALSLgOn7N17HEf99dPa/N+uyjEsbgnVyBY4L/3tf266svGHoU31QB7o24XmR7C5Kcx
	mc5x04CshHYxesUNfvZnWH9Fw02DIKrk6D/qIc4NdzlohIJ4HvlO94BVtBfj0f/rm/tF3/5LcYM95
	pfz5lAvGZAY7Vljn4enLxWezNUuxrSQLd6a1jvgY+CnYl8DIzI2qanX4NE1FE8Lx8SJzjbmEAO+o3
	kHLaJQ/VvLcjZ0t0IZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69SH-00En8E-Py; Fri, 16 Dec 2022 12:04:45 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69SF-00En7F-IO
	for ath10k@lists.infradead.org; Fri, 16 Dec 2022 12:04:44 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 79so1591174pgf.11
        for <ath10k@lists.infradead.org>; Fri, 16 Dec 2022 04:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9mXC3HPGi4SnTUKl47vyKMshaiteCDhTRS81QCs77c=;
        b=m7cjw8crabx8KlKGQrst9fR8O1t2yxt8m9H3nFETO6imjVmYBLkdbBFU1+EBPQpevT
         oS0Q6dmT+58ZfalfAMbywVXqSPiF2l51wQ3/pfSedYILOPqAVD1nA1JDoQTluiseP3YR
         pcfH5oqi58+Id4i9jywkWBOQNdeiMifSpJzMbScizu5i1/Zd6ehw3I3qYPlMRcMpHNIf
         dqyK6asck4HZyI10daG3zkmLIQIGXQkDErqHWkfBKH+MhI0zJ5jK36WmBeJmgbgZsngp
         xeJiAtEmujjOg9xOLeNwugydT58GEq17iiPH87kxjmQayt0M0htfyEWLSDMJHwOHDR/z
         /FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9mXC3HPGi4SnTUKl47vyKMshaiteCDhTRS81QCs77c=;
        b=OyxnKtSNK2vTc2pjwpiOKJzGZESQVr7LNHYmVadJLPYZxxzn6GusYa8+Ba/My5ZdYl
         1/DD7v/URHnEJG9ldqdqerpUbYb2DB2CXuVEsOdKFbIQKwVL4JV9hx1IQAj5f9rRen67
         Q0JPeYwbfmjVAIcple/mum+R8ps2jsCn2iHmZGh6TsFzl8nDvI4XoXnse2qemJeGFDev
         A6EWXRj0sA2fyoV+Ki/Nr6ZTYA+v8isQOlQVIWUEzfbhVlFh0LeuzBEGUpjIixiLPF5/
         KEeoteBqVx7nBLxdGd0P/ivAVjbNumjbQn/I0u7Qh4Yj6bqY8jneY3pVgoNqy5v1uIzS
         6yNA==
X-Gm-Message-State: ANoB5pmrjnbF0GVslM2YSWR6f2XGY0gSUorLZXxNdFgdErg9c3bjPwUB
	PnWyrFtdC2xAg6BAdIPClplwWgCpQ4d4fWTCGG8=
X-Google-Smtp-Source: AA0mqf5tnzdXarz4cLuC1psT15pF8dbErmLY7pdu3abV30FzMk3Scy0HKxN9Sy0NPEwGh7fuMiea3cItEzmWOvmbZLs=
X-Received: by 2002:aa7:8c07:0:b0:577:a422:e57d with SMTP id
 c7-20020aa78c07000000b00577a422e57dmr5559628pfd.74.1671192280935; Fri, 16 Dec
 2022 04:04:40 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5AW4JUEFiaFgr8PvC5x3a5VWA4Ut8cXYYAme5-scgBV6Q@mail.gmail.com>
 <872024534.20587.1671097586476.JavaMail.zimbra@z.j-2.se>
In-Reply-To: <872024534.20587.1671097586476.JavaMail.zimbra@z.j-2.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Dec 2022 09:04:23 -0300
Message-ID: <CAOMZO5Bv+_2CN_CGeFswRCQp1-2fmuFZj26enxEeE5gpva160w@mail.gmail.com>
Subject: Re: ath10k: IRQ timeout after AP-STA-POLL-OK
To: Patrik Arven <patrik.arven@j-2.se>
Cc: kvalo@kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
	ath10k@lists.infradead.org, Bough Chen <haibo.chen@nxp.com>, 
	Kevin Groeneveld <KGroeneveld@lenbrook.com>, Jakub Kicinski <kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_040443_623383_5FCA6AFE 
X-CRM114-Status: UNSURE (   6.44  )
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

Hi Patrik,

On Thu, Dec 15, 2022 at 6:46 AM Patrik Arven <patrik.arven@j-2.se> wrote:

> Solution in my case was to revert to a custom(?) qca driver:

Thanks for your reply.

Yes, I am aware of this out-of-tree driver, but my intention is to
keep using the mainline ath10k one.

Does anyone know what triggers the AP-STA-POLL-OK event?

It looks like whenever AP-STA-POLL-OK happens, then the eMMC interrupt
is no longer handled and causes the interrupt timeout.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
