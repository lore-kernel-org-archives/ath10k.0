Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B81FC52D7C
	for <ath10k@archiver.kernel.org>; Mon, 12 Aug 2024 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sv96XB4gZxCxlU1SRHBLRK7/Tf/KJItVDb5kLcxytxc=; b=HuzPKA0FpRRKK/d5gvNgdbAq2v
	+FgdtwGLcEs0tG019o+GX6kGVzLah2brK8IR6cFXILyBF0cfwhx2JhZ5DMtwIDYuE9G7iv3zRM4tm
	f23f2Z/a7lvTg51PrIH5c1x/7zP2INGVFYXElP7vCKAvUuNSDp+or+fMwgkx/p1JVNVV8f5pA+lRA
	MbxAgLXGdDY0sVh+34DrXYBKETQgdSXu0Hk9ClIz22NEdtpqWiPSpVkjfl7xNNWrAQmdh22O1ibMf
	gXqZdSXWjvKGAOy83b6GGZ7dZMrH5Cqty7OavxGAALOoo6iuK9N5McBOTa2sR5BjgCNlFJGX05YHU
	hq8iNpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVSH-00000000U0o-2JKe;
	Mon, 12 Aug 2024 13:51:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVSF-00000000U0L-24xU
	for ath10k@lists.infradead.org;
	Mon, 12 Aug 2024 13:51:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4281c164408so32407645e9.1
        for <ath10k@lists.infradead.org>; Mon, 12 Aug 2024 06:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723470681; x=1724075481; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sv96XB4gZxCxlU1SRHBLRK7/Tf/KJItVDb5kLcxytxc=;
        b=HAGHdYww0wG8mjC+gDkTyedw3sCpUMOaAx9DCYxHqZFhBOhdHjnHgEfZ4X+hEnc/vz
         JaX/FkO1yYOhta0ljf3qCBqU+Hp8EkhCvMrwvSXhjw+4SaCInEb+AhDqxxeLP6SHc1lP
         MDOfP40NLN05OJsRtl67sx8+gD1QF/mUXMutR82gRH/Xwq0qvQP3PweJzck9Gfdp3ttS
         ZQhhuywoJDieFtzQBYFNTtPwvq7R9WH3bANlh+k43g9llmY8aevVmCP7gneHoSGMN+B2
         BjFZT/i7nt8SZs+Jo2KkAnNCId0Inxm3IbRB2V1Oewm/mF5I6iyun7s4SMyRStfphqUp
         lgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723470681; x=1724075481;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv96XB4gZxCxlU1SRHBLRK7/Tf/KJItVDb5kLcxytxc=;
        b=BcEZ1+nYPXmO2Gz1iRio5TuduIFiNHRwvTwRk/TT94k8uImyoRarfzi2/tJQLQ/eYc
         HaF40QPCXO2mE3+3NbganTdv4z3ThiFQsyrjUtrXnaJveYSTRbE2edGPPmYagdKh/wKT
         rpr+DHyqmQKaHQCRPDnf2mFhEJ3nDKQvb+Xc7GKwjpQPJYMC/cSU37z2KVW2hL68JeMc
         k/80EqB2/UBd/74N/HAY/bcu98mvMNGBt6tw84zI4WGdwRSpRbe6fsGa2gnIrKWfvrvh
         ekw6CqYRvID5tofZ9yEuwPIJIs97OGQGMqYVUTCKRnZz6IgMob3hfe23BBiAsYmzKDV7
         js3A==
X-Forwarded-Encrypted: i=1; AJvYcCX2q4HgLLB7WHRFh3c0+Q2FM9j6RytGn8K9bxYzqVTyEyXyyQ/zJpRZWpukEaom6gQxwOBGfjmNelgxpOBeA0gSRXNokj09JEWVIw==
X-Gm-Message-State: AOJu0YyCWkpoyHUncbm7L47XvAkq28/D3YfXiSYTbl6Nmq9ibNa9Q0BH
	w6LE+6eKbwub5nxc4NBGlxRzp4moMC7ZDQjs8wv/j9ZiKTEGEczRgrqTsyrb
X-Google-Smtp-Source: AGHT+IGT5u1NqSmVw0khE+rObz5Dg6ToYQAWxdK+XuqNfbiah4Ndgm9Eh0u5p4ztbQyuH0eo20TEng==
X-Received: by 2002:a05:600c:4f0d:b0:425:69b7:3361 with SMTP id 5b1f17b1804b1-429d48188bemr4324935e9.18.1723470680629;
        Mon, 12 Aug 2024 06:51:20 -0700 (PDT)
Received: from smtpclient.apple ([169.224.80.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c74a855sm188663005e9.25.2024.08.12.06.51.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2024 06:51:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [question] is it possible to enable monitor mode /packet
 injection on wcn3990
From: MOHAMMAD RASIM <mohammad.rasim96@gmail.com>
In-Reply-To: <87zfpigr5t.fsf@kernel.org>
Date: Mon, 12 Aug 2024 16:51:07 +0300
Cc: linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D802221D-56B0-4CBB-833A-EA548A36FC7E@gmail.com>
References: <CACq04CG8WCGDxf6Krx3bjxHU5OtYJJNOtD77TtPQhTfdy6ey_g@mail.gmail.com>
 <56BBE89F-FF40-47C4-A4B9-F492FD8F6E2A@gmail.com> <87zfpigr5t.fsf@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_065123_556715_686BAA92 
X-CRM114-Status: GOOD (  10.87  )
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



> On 12 Aug 2024, at 10:02=E2=80=AFAM, Kalle Valo <kvalo@kernel.org> =
wrote:
>=20
> + ath10k list
>=20
>> I have a device that has the wcn3990 wifi chip that uses the
>> ath10k_snoc driver, i tried to put it in monitor mode, the "set
>> monitor" mode command succeed but can't get any scanning working =
after
>> that, does the chip support such mode?has anyone tried monitor mode
>> with this chip or other snoc chips?
>=20
> I doubt that WCN3990 firmware supports monitor mode, though just
> guessing here.
>=20
> --=20
> https://patchwork.kernel.org/project/linux-wireless/list/
>=20
> =
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpat=
ches

Some people has got monitor mode working under android ( different =
driver, qcacld-2.0, and qcacld-3.0) with these kind of chips: =
https://github.com/kimocoder/qualcomm_android_monitor_mode/


Some older chips (wcn3680  think) even supported packet injection(using =
the older  qcacld-2.0 driver).

Commits in the newer  qcacld-3.0 driver (that supported the wcn3990) did =
contain hints that monitor mode and packet injection should work.

So maybe the firmware does support it?

Regards=

