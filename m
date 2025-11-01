Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5355FCCF9F8
	for <ath10k@archiver.kernel.org>; Sat,  1 Nov 2025 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6FDRMvNjCpM5LhW8oA1BhHC3fA7lHDvd289NfjuJEk=; b=q8tMNgXQ2+SKGQaA5BvKEQiCpJ
	8meN0QqnCvwmj3xzhEbfIcv947KUAt4xrAEC7cvYv2EP/WAJGxkVD6WNNGpq42oy0t5kuKUwnO1G/
	j0IuUz1BF0R2PsmNkzKnftltU0ccgBjILsRw0+unX26RV2dvwD2G8TNYlcc8yZNISTR9oSqz1JEH8
	n6CF5Y3DkzAZEEhzAoZMxnnWqSuEjXzeSlMVrLhVv+J8SkQY713rQuowsifbSI4Cp31UnL7Xptawk
	rnEYTETneAs07ZzmbXeeALyQGBW+gq1eCtS2dIZsL1q8zLXn5Nulf29YFL47m/yO/7cAtSa/XLeFr
	dk/IGZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF73d-00000007Bg1-0nNi;
	Sat, 01 Nov 2025 08:33:57 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF73b-00000007BfY-1dFe
	for ath10k@lists.infradead.org;
	Sat, 01 Nov 2025 08:33:56 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b6d83bf1077so609204466b.3
        for <ath10k@lists.infradead.org>; Sat, 01 Nov 2025 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761986033; x=1762590833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6FDRMvNjCpM5LhW8oA1BhHC3fA7lHDvd289NfjuJEk=;
        b=hxTo3QmnyKTkvw2dX8DItMB6MWCAxuprXT+q4Ib+ZA5X4iQ5KqOOUcrWcedARjpiHw
         c8dHvoBOAuXSuezjQPyF3cyuej7Ou9gr6I3h6//uDvNtS6nzuqOq2KqmFdzNHNAHT/5q
         d1mfGbkqFT8HYMqzp7sjl29ixplfV4WGaCADhRqGOhIe0ZDwpPzCvqnlYcH6ybrbyDj4
         OzE+9a5vdNPUgFPQ6fxVdb1tXvdwi8EJxe0tUYxDTxYPGX5PMHEslEwoImRXLZqeSvxx
         3m2VT/7eEtT1TfVuvtS5CBhya8G18scJe/Px7UGyQCmHzMH9T7JjibNNKDQJLnT+Ik9E
         YlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761986033; x=1762590833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6FDRMvNjCpM5LhW8oA1BhHC3fA7lHDvd289NfjuJEk=;
        b=wxls1kMpYriE2r5+aIUqJSPd7GwmZVJ6UMNeQqBrdjo3od1tv/L7CD5HP8Jg6qN/3e
         Qipdml/IA4/QCgrdijcEuwHBUSNORSfeqAHZPsql8iB+bckroN91rv/AuRdMnrl5XzjN
         7P/t+fudShHtj//HyCqsKcjKcKhAEu5TjC5GT29zgx9TNBdUITO/rqlDMIhSHB25KlIx
         z5W7bBOGz9xezrRK/lzUklvWghrILAvJKSk0cmy78bWAruknet1YYZobPqKGWLIS8kS+
         NSamD8sYvVwL7qp2GQPZAU6EynbM2HewWwfzCqx0Oe0vCA1r+WZ+HS4dgQNZNzkIXLWk
         IUiw==
X-Forwarded-Encrypted: i=1; AJvYcCV32LT3JsQLxnsBmX1jAn8g5CDTmq6Jxd6bHkEhSTeP7LnEp4nmZYT/vZrEUedzyH8ZMR3yM7g=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd/6sQ5gF8+2EhHiIcB81s83ej9DBOY0NjEiE484HGz7WY0S3r
	ac4MC5orHDd3Z0LkUkay5U6kMCByLur5jB0MbLZy2sH6O4CIlXC3o+oon8U0lwUBAGZXlF8VDGM
	Gl9VvqdFrn2I8RiIJC99vFCROYEyfay4=
X-Gm-Gg: ASbGnctzehCMcPgbtAPAcp4N4ywIkaL5COI64hxIJfmMuq8Dl207n1PFyox3UnXbJSb
	LakMoiu9F2UMR/fBzY8ngAb1SVCbrb1zT8b+ePLqdfju5grfQmPXRwDPnnHilKbT9ozCfRK18Ku
	X3aISfH0m2PknbJh2G5C7nRihfKXkbnmHHMIquLyXRJ4Ww+/+XIS4cCPn+NpCW1Qcu0RH5nBZzR
	XJU+ZTkjaFI/68+LmijxYwh6YtHL9/dzUbY0Jrhs5ZrWwjwH+CaLODcszAIbZLeRge5QPw=
X-Google-Smtp-Source: AGHT+IFFNpeJR9dbHOFQiQ7dl2HrM0sefQRNzTRSLtFVnX83H6VZ3RyD1DGUtnaezdZpBQrS3kk9GBbj9+zKnfj/3K0=
X-Received: by 2002:a17:907:6d19:b0:b6d:6a35:99a0 with SMTP id
 a640c23a62f3a-b70705e3de7mr643662466b.33.1761986028413; Sat, 01 Nov 2025
 01:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251031111639.406873-1-hujy652@gmail.com> <6de0a467-14f3-43e1-952c-b8cc7eb4801c@oss.qualcomm.com>
In-Reply-To: <6de0a467-14f3-43e1-952c-b8cc7eb4801c@oss.qualcomm.com>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Sat, 1 Nov 2025 16:33:37 +0800
X-Gm-Features: AWmQ_bkotIWEYeL4LFQRHlK9ja_7OBUjk7WwHRpeWL4qz8dPtvmOxKYUFA5-LAc
Message-ID: <CAHGaMk8BZiA+_ucfqZ+AnBe1ewuagADJfMK3UjECU3rutOW-kw@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: simplify ath10k_htt_tx_mgmt_inc_pending
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: jjohnson@kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_013355_434067_4802F180 
X-CRM114-Status: GOOD (  11.12  )
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

On Fri, Oct 31, 2025 at 11:00=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 10/31/2025 4:16 AM, Zhi-Jun You wrote:
> > Remove is_mgmt from ath10k_htt_tx_mgmt_inc_pending and make sure we onl=
y
> > call it when it's a mgmt frame.
>
> This fails to describe WHY the patch is needed
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#de=
scribe-your-changes

Hi Jeff,

My apologies. I will try to describe it in this mail and update it in
v2 if it looks good to you.

ath10k_htt_tx_mgmt_inc_pending() is called in ath10k_mac_tx_push_txq()
and ath10k_mac_op_tx().
In ath10k_mac_tx_push_txq(), it checks is_mgmt before calling
ath10k_htt_tx_mgmt_inc_pending() but there's another is_mgmt check
inside which looks redundant.
The function name itself already indicates that it's for mgmt frame only.

This patch removed the is_mgmt check in
ath10k_htt_tx_mgmt_inc_pending() and add an is_mgmt check in
ath10k_mac_op_tx() to make sure it's only called for mgmt frames.

Thanks for taking your time.

Best regards,
Zhi-Jun

