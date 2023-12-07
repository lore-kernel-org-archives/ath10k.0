Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A64C4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=el4KRznzVU5IlewCKT4pxzzQ73Z3gnpPLuO51EUCaHk=; b=aNYz8ClZevuf0wQNfaPrM3LzAN
	ekHu8ET4FvfwgnnmCCJHdhDKoJNN5bglxluRAJNRwjl/8AdDkWzYVhOQiUEvNeSzSiwdlLBQq+5/T
	LNnyTIvgvRhBSW5unebnTFPZ3iAQHAO3agHgHDvrX0DwF6yMi/u2c1yeXBBmWLFb6LQ8P2xG5WuxY
	R7AaStbJcazXMcG0bL7ZlpwxH6lsqZHZcSv0FCXQEVW9pufLTG9MiS+jHTiq3tIx3+KJBRluY39mn
	3ipzBdU23/OtgiyTN8dnU8MMnH+XoP62kdXjZzoTure1dmYpTRDTIgt1rRqAC74gdKtcBHuHydbYh
	nx3VesoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGkq-00DLAh-0p;
	Thu, 07 Dec 2023 15:57:36 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGkm-00DL9Y-1o
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 15:57:34 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dbc38f3fbc7so733122276.3
        for <ath10k@lists.infradead.org>; Thu, 07 Dec 2023 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701964650; x=1702569450; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=el4KRznzVU5IlewCKT4pxzzQ73Z3gnpPLuO51EUCaHk=;
        b=r5Jy9iZSaVHcgRoqocpkgFL/vHBcLzff9dc6Eh1r/3cspuu1xYR+U2v+fpMVpP4kM6
         yDKkCmxZ82cekzp7441Q7RBkDK5BuBo0fqmHBxw4dVpYkyPeKu44epd0G5WW7OY4957v
         nt1Lr3I3+3q8ql2N26ng1RkxcWWEm1RH5a0ht/+zuMs0SMdhHvtfimeqjbgRdyxAJI9J
         cKLKq8X777O6nRbhbB09u/QB/RMPQYmKcDrv4dOJgxTSXoDz8nUauP7WjkgERE4+Pq9Z
         4KsixPLnI0s6GQLo6WViOMbt76U4lW1S5n24nXDqdK9nY8lMYl8qw2zorE3MkrBBL8dA
         uOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701964650; x=1702569450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=el4KRznzVU5IlewCKT4pxzzQ73Z3gnpPLuO51EUCaHk=;
        b=sLwYH768qJjnkbBrFO6jPhrr8gPmA3WUlKDJHNbpYFfQOtVE4ACHlgTL0VLPAGIXQh
         MQa8OiM+jc5GRfSRAd/UIvPs02FhMCVR+kF8/RC/kkmOEBasg0mk9uQGpH/pno4IWmkI
         vuaCLWJVhjRCfIuhPOcIxMiIq7S7OJ2MrgNw5cPY59NcPb555tYeIH+bND5oCp+Tspo3
         BwkY2mS6XBcV+rZGF9TfjW1vIwO9EzJn5emRYp0DG/tnCr5x0YLERqrYXBm3jttrh2nZ
         NlYe/pHBD7ciaMPpZPbZBHlyVs3cm4oipBjR6EOc5UXz8YEiHIZscdarEQBt2+SuIqM5
         H2Iw==
X-Gm-Message-State: AOJu0YxUk38pcyYDm3RE4tb5a9iVtKQ6ztrTlp13YryAqN6UT5jeMeJF
	nJPThvU/sn+mOOCgnF8IVz94FrC7wGxcEqgJnlGXpQ==
X-Google-Smtp-Source: AGHT+IG9r4TtcMNcv43vr160Du4eCcoL2z6SGity1U+65JMKznfVphViB/nGW5INoL0z0okFG84CnjiYfCvR/DgIFGA=
X-Received: by 2002:a25:2cb:0:b0:db7:dacf:3fc9 with SMTP id
 194-20020a2502cb000000b00db7dacf3fc9mr2323879ybc.118.1701964650372; Thu, 07
 Dec 2023 07:57:30 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpqg-CrbzpSqO9W6W2c=V6TN0Yx5mfih3j4cYeOLNRz+Ng@mail.gmail.com>
 <87wmtqm536.fsf@kernel.org>
In-Reply-To: <87wmtqm536.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 17:57:19 +0200
Message-ID: <CAA8EJpr5WUN81qezPx0t8H+AZSHt98Uq78kJJ7wqayAZy0NhYA@mail.gmail.com>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Qualcomm SDM845
 MTP platform
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_075732_596415_54C52053 
X-CRM114-Status: UNSURE (   6.22  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, 7 Dec 2023 at 16:59, Kalle Valo <kvalo@kernel.org> wrote:
>
>
> I don't see any attachments, forgot to attach to it? Please resend the
> whole file.

Oops. Done.



-- 
With best wishes
Dmitry

