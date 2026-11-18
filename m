Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA335606A31C
	for <ath10k@archiver.kernel.org>; Wed, 18 Nov 2026 23:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y9HUbhpl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXlnvpQb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=; b=y9HUbhplmCAFJhMUi+YAROgcsh
	c48kBEDOPHQ0uCJJTuNLw3+goHd7IC5C84M4Zrfqn6E81BtMIQbfeVIWm5MC+5ocQ/4pjicvXvGFf
	LH/7UMeFTxWTeu4A0WHASxtHFUe8ppnZZH00Q49/JYngG+YWGBcX9FOf7G8CQ77NLf5ac4cKB1sYy
	s6330jSJEY61z+u1btly2yblCOkFb28bxVUS376pYFb+9HgWOG0lYMEuJW2xhwGXw9xN1B5pCZzt4
	Tq/oYA9SLKO/WnjOClPFowVJ1Ha+cn0QS3k53ueK8+AqL9mLkqTgG5mbtpiqbXomDfQGfsuGxCv8z
	E4YDYQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpO3-0000000AWwO-29Vj;
	Wed, 18 Nov 2026 23:48:23 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpNz-0000000AWva-2BJb
	for ath10k@lists.infradead.org;
	Wed, 18 Nov 2026 23:48:21 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3712b6d9843so1822774eec.1
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 15:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045699; cv=none;
        d=google.com; s=arc-20260327;
        b=JOSVA1CTm6eQBZ9WgTQxfMvi0b7aoXwl/yyksBLDPR93lCL5e0YXdLxSSPIVEuwpD0
         kSRWI66iS5+LX8tzTkhiYGslsA9EVNzrCYzQFwmRaBuDrfBCYEMcg2/K13b1XBWaMK9L
         CdCSk9Su+LiYjTpwTT3V2FccbK3kvBm28LnM8ohkK6UL3/1+UiTk19OByIUGOILQd4YO
         z0SEG1cBxM5nHmqahbAGEOs7tHw8rXZ8dofzTy9QZ6wYdhzoilmkb0X4NBis3Yjz3kj7
         r5PehQjeO3vgV5/l2A2n/rF8E6vIrkbRT/IoLYWFQE3oNDetxqMr7XRgxy3OU68IyzgG
         aeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        fh=pzZPFZbcjVLMj9CUb4U4HwG9l0S74BYQ0OuUhqY89KQ=;
        b=FreyDyExq7FTPCZe5fLdIJ0pIz2EAIumng9VlMtUO8v/OBWpOqOTHRyNXcEq3Gy2JP
         v7aABkXq97S+D7R9fm72CeoHbarJF432Qsde2vwhxb5BXoySbITwoNwJ2O3hUQTN+ai6
         ZxjeYPgL1W4IuLFXHNLPS6bmKpl50/Pnas72I+A/OTg876L9V7AZ8CD1C1tvh8XHhUph
         bo1DUtm50rVx56i7+XNNbJcZ8Yt5m2iGBWaL2kD1KeMKlf/a7neT8j7OY+gsRDveD14g
         whWpznM5AdQM050XD3vLdSGw7Z45f4MmMTYSA2FwlcHRhVL79eWSoHuukl0bZRzVdPD4
         Ywjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045699; x=1795650499; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        b=vXlnvpQbjgHsf/tKyRB5Fe4KVBfDTVijDQe4lte101TZsLHCoAcqPYdrPbnqRJv8Ee
         PR5zXERIaQ2PKDd6KPtpqFA12REzTijj8xBiMYaQ1LOSiBX3NFLauAumFmtjtsRBcUOJ
         EjqdA7hE4R0yyHmwU1sA2uDQLQkSeOHVC2gBuUukdgDNvdRIjrFGvxruGtT3E5sQQEG8
         zVPKSxowKvGnukbcgxNGxm7EvuQpRW8cBXJUGgKnq+6uTSiCHX5fcv0+Xeb6h6OXyUpr
         tsPbJ4/9sTgUoP4cnlShhBxzgp906ONdGJm5J1o2ZCDsBwwZ/C4qELorOt1dP0Lks26Y
         CY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045699; x=1795650499;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        b=m7nAKgg+IuoUAU04PVOa9eQ5h95gD5mkZqhfjC7mmIcaAE3K5nQu7C2tCKOccWaJBG
         wDaUIIqhFvdVK44E76At+gvgACqCueD8yBu+tR4UJEt5XNHtUG1VH9rkoEyRGSRoO4ph
         bdjZErd/5WHuH1oyyR83gd0kdBPlBsgI5bx1ZOTqR7Cy3Fslv2sfli5fFITjonp0nOSA
         +3vF25wwphdYU3c2MUGcrnkvxY/7sziC33gLSfBpeOiPRsMgO41s8yYpCxkM7mZZp4SG
         9v/PhEQdzoPSjlT9+rwG6aYIwl44jj6zCZnFen8q/rG4vlydRQEhwSDZT1Bt+wt7E2tM
         CgCw==
X-Forwarded-Encrypted: i=1; AL+hErEFHHPi7CE07vpE8ZrYUpwhmKxiHhztZw8+zRpiOkxp3P8rOdMkV6KgQY+XpYTrcMQl6eSOfZk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8Jww9yckTecON6HSa6bqRFhOUj6pO5LSsaApwrMDGzQ4YUBWMB
	sWDmme6mmTJB98coI9eNPJveLDFfuG9G3V3MfdbGe2XQ/DUIm7+3oaJ54iaHhHERkFvihpD+YXR
	EuDWY4vP2P9EOmdsd4BqbHgBd+vzhsAc=
X-Gm-Gg: AZFdTZforpD8pmN2mWMGZYLehlIYdm9vL/PpAV/vgvcF6QP4us1hJPCFKni2Tc/Xv4N
	4E9F2bQ0mmPkamJYIjdPxi1m+iGL/YCLI3On4tMG6tTQ71wNabRYkQHATL/vcoae2xAyIRdVfuK
	OehB2H4rqTU3rmEV1rncc1BeLJr7MUH/BoLu3AbhmP9lqjx2pkIF0S16u/RjMFcO3goqnz0aRUn
	6e75VBPp6+fi3WkFrAjP6+AOcVaKlqdpLIWYN4lUsBIuHkN9sZHGvjbxpvnMwHY/ufyW4tyE3hs
	UFLY4u73QPMYP7XhfZwtXgXDgJT4NxrIzcUHUWhtSRBGQc37IWSim3ILQguwc9K7ss+xjflKEAi
	UMYKXFDIS0tkSSx/aLncsrKodYwV3QwQE1vNMDT0G1Fqe0Yu7WV9logqLeWB2UmuwOxN7HgUmJ6
	UbLoJVfPqyFxFZNagJCQ==
X-Received: by 2002:a05:7300:d210:b0:380:f8fd:d19c with SMTP id
 5a478bee46e88-3828181369cmr4316220eec.35.1795045698347; Wed, 18 Nov 2026
 15:48:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com> <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
 <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com> <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
In-Reply-To: <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 18 Nov 2026 18:48:07 -0500
X-Gm-Features: Aa3M54rd6z901o4jFDdX9BIXR6e1rb-3tXX1SIFSQ_6Oa5HFj9_O_6QAwqOnrbg
Message-ID: <CAKefsHusjRX+jo4DAywmVTEqn_Ypb5VUBMfZq2VbsEPNSeTq6A@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Wentao Liang <vulab@iscas.ac.cn>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_154819_565255_5F100C41 
X-CRM114-Status: UNSURE (   4.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for the explanation. I will split this into two patches and
send them.
(I accidentally replied only to one person, sorry for the duplicate.)

Thank you,
Changyul

