Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFDDCAC5A0
	for <ath10k@archiver.kernel.org>; Wed, 17 Sep 2025 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9NBOLHxyYWUxTCJ67GeHZh+kdZ522EcevTTLoASKRI=; b=ebjQsN79Ij/ROqXUsE1f3KsDBp
	M0F0V2bO9ieT4JKfM64QtuM4JF6M4h6MJHVkw5z7bB9chWwN8JAZ/dSr6vx3eh6Y3N+iBS61tFo20
	WvZctSoawOWLWIDn1VtUd5WTqaDej4sqYIiK2+UsxPEl5qJv6rlsg5hIs4Emx3W5oi61ckccuyEji
	XEi044dXcnOWFrFj6nsfTuYDAzcYZteX6M6l6gNV7JkMlqWGDsCy4UGJX49dMAwoBCITZAt/5DEgN
	LyGMDYkXcjHF3W2kubC1ZflMkjaCpNyV9ybxkL0jQ+0fvp1MbiojbPtafxbF+1g+OS5Zp2nnFwUg9
	XuPI4tfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyur2-0000000D54N-3aw3;
	Wed, 17 Sep 2025 16:18:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyur0-0000000D53p-2b9b
	for ath10k@lists.infradead.org;
	Wed, 17 Sep 2025 16:17:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-32ec2f001abso1227193a91.2
        for <ath10k@lists.infradead.org>; Wed, 17 Sep 2025 09:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758125877; x=1758730677; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t9NBOLHxyYWUxTCJ67GeHZh+kdZ522EcevTTLoASKRI=;
        b=U74MRVka7w4FLq/+pD2xEH2aU1pEau36Xapx8J0IHN6HZT8/cVcsx0AqZBByTsNNP3
         9o/j3FYE6SpEvxTKgwDesf0SfXOnJdzGNMyHsbx+5/bNmQP8jwGP0/I35zzHap6o+Fke
         1RVhREEWfM1xGk+v5LnEvKDzrNOFlB5PIb71d6YSu2ARBWpZaf0DnHbi/t1xxX6Hr+o5
         3T+GebQ7HFbQfBCzNLfO0iW89IBHeohuCfiME/r/wqjkMqTYn1VlgSx5VV0z5CNzA0Il
         0O6l1pTNb0Ke/pLluybGMrof7NxeZj+cjDikd0zXh3Ki9KazvCTo1VvLM/SmP772AdeU
         BJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758125877; x=1758730677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9NBOLHxyYWUxTCJ67GeHZh+kdZ522EcevTTLoASKRI=;
        b=vEQ4pdkhKAgPYxRQkah2TJk+WChPF6RtU2Q5ClpW5h+vrjtInJE3Ae3bP5TFtdAX1k
         xa+vk9GqZGSxrDlixnZw4x5tF5DStqubNssWHeFBJ50tE4T/iHSFq1vUDHcC8QxE62Qh
         NI4/uWIY/AkNUnaChDBOg8ZSj1MiQac9uNxyjoECmfuanU67dUML4dksNc7RgPz3MCRy
         sWIjhQFcFXri3zcGTuHiCrbB8SevH+v/8+/nwFl7+p7dBpBsJB1nK1dTLNZHzpap22OK
         ihXp+ot7ndgHZEoeD9acEm22IscZB607SWmVgiq1wmd/F86AaOSHJk/lh8aKbHRWgW7W
         sOdA==
X-Forwarded-Encrypted: i=1; AJvYcCW7+kOAVYKHHvzkuLdQTj84Q9kisqzXb9kB4EMtGXfbKrF3Hd5lbkzT2mixhH/oWye5K51bfdw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2D6ZyG9UmuGN4nBxZ5m8+eSGNi9Nr4sXtU27+A8LuzjZobbpR
	PlgKwRbMchwxokTy2J18XrcC+QolCLvOaC7ttxSsec8fx4Ra7riUmpmpRYmAoz9jRvw/jxjKdBx
	ujBmFbS1wYLuE1iSY80yO3UW3GG6+fQ==
X-Gm-Gg: ASbGncscDmmoKm9/a287RfijjQ1Pgvc3kzpKWFr/w57Yia11K6UrTYc5EeTYlrJ5CFd
	lB+hnfHBb5bsXg3QvDZOqDrLQfbmsL3/NQ8f9vXYbLayZ0tx3gcBTTG5ZU53Fn8QdBca16FLeYd
	35R1mBfyaT+E8jJITPpZsrLoc8WqHGQZDviSsrYJ4dtxppFN2OqJ+OLScME/Yesp9CyQ5W5BM14
	HT6kQzDHeATwM/cymglKCMX
X-Google-Smtp-Source: AGHT+IHhWVMCTt4FqMqxsaSGtlsIXs228pgZwWTuHQW/DpH6t9agezpr14wLKdatbZd+xu+bC1vNCkjiD3OQGJe7Us4=
X-Received: by 2002:a17:90b:4c12:b0:32e:2059:ee88 with SMTP id
 98e67ed59e1d1-32ee3eb5a2amr3782547a91.6.1758125877216; Wed, 17 Sep 2025
 09:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240801202359.794035-1-frut3k7@gmail.com> <20241009065051.51143-1-frut3k7@gmail.com>
 <b58b5b2e-bf9f-480c-810b-2cef29aab82c@quicinc.com> <CAKEyCaDUfn4jtCdTt9JJ-Qe+CCudORPwcjj5i5=G28ANc+eCRg@mail.gmail.com>
 <87ed4dr5pj.fsf@kernel.org> <CAKEyCaD-1GO1NL-=1E92BE9=XKa2PymOAY14vMmtwYGLsPjeUg@mail.gmail.com>
In-Reply-To: <CAKEyCaD-1GO1NL-=1E92BE9=XKa2PymOAY14vMmtwYGLsPjeUg@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>
Date: Wed, 17 Sep 2025 18:17:44 +0200
X-Gm-Features: AS18NWB9R7Ie_lKbBliZB9szhNdDYZ285LPdqC-P9iVC3crG-nKLXWUxCy_BQt0
Message-ID: <CAKEyCaAaJGUX56Xp57KWkouCgpOyPNTqysRZyGtfsyoJ+ERMpA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: add channel 177 for 5 GHz band
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_091758_654612_06A7056C 
X-CRM114-Status: UNSURE (   5.08  )
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

The changes are added in the ath10k-ct driver:
https://github.com/greearb/ath10k-ct/commit/8f2254b8e0554e78efcef5fb752be0eb3573d281
Is there a chance they will be accepted here as well?

