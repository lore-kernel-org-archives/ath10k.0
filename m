Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966E606A329
	for <ath10k@archiver.kernel.org>; Mon, 16 Nov 2026 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rv0AnGlO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=je+IeyBU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PoGuIV2CW1MyjUCqGaI+U1vpCobn5gb5K6UIl8jT3Vw=; b=rv0AnGlOuypebN
	gEbDERuiVMRy/l1CeCwJlsKhU1tjPKTUi3ItzhFEH2xuKDDTk05V/ilZHibpUzjuRycs1yiYFSGUx
	sW5V2QG55CGfnbyMCkvPMbraL+dhRz0UqsVGVqMBiEypC3XA6q04nqJxyrGZDNaqTsWAzU5bV3Bau
	ILrNdWY/Xe0zZyTP9/p4xXUEQubCGGSlbiRRTGWnYmZf/iPvklE6l8Dz4ytCtrM0MoO2gUVEl16ZE
	ioJc8OJxwHZwD+qSJSsnCZWLqACB612sU5sYruA3tsRl/oqENUjQrDTCY4OOgB0hr2TACCR3qEEhk
	gDxlj58CLaZRX+Dj/uOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuSC-000000023ed-1iUB;
	Mon, 16 Nov 2026 11:00:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuRx-000000023Zy-2OXZ
	for ath10k@lists.infradead.org;
	Mon, 16 Nov 2026 11:00:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso34740085e9.3
        for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 03:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826835; x=1795431635; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PoGuIV2CW1MyjUCqGaI+U1vpCobn5gb5K6UIl8jT3Vw=;
        b=je+IeyBURDSNt99TNca87vJvrUmvP5utZ4sEHxIDqxnHZX66ro90rOtHYVINfxRkPA
         aW44QuzX6UuCCbA7tmQebQNVW1PmXpm3hQEkz4BZ47SVpKdoa99HAE8WraCdWqBbLr2b
         Xq7aub5zK5dhlNATi4FVXTEiouY4zWAhj5r+BXASZy0N/QYdsHMZ5N0s4sZngaNnma2B
         4uRcefGU7NQAYpNt6qjKf2BpVMkSsxM3hcSar98l/3bmq+SFSCnwdtBgWZb4NQsXDq+M
         olkiiNHV78dMdwCJweISVSo0XCe7kedTQC8zWqIDvh7XhMjiPxGCj90RAPaIuQnMkTli
         mFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826835; x=1795431635;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoGuIV2CW1MyjUCqGaI+U1vpCobn5gb5K6UIl8jT3Vw=;
        b=ZKF/49Ys45E5WgrCPBOomKuJ+UBh/CtZ7o5TpbvXJotuIanftAOyB630kHVfotK+hG
         QYwL9l1kSvHsQOVX7pEdyEtqlM4+TzDU9MLmT+eBjqN71H4XTSodAeWe1guTaMmJAYq3
         yvV9XrcVEnVyBdLZXfPMICaAuqNEBY6KYJNKStYNXaSg9M8oN0RGTMBpOPmobAV1bU/m
         lxfdUXcmCCW9BrUSRKHQy5qBVD3b9wRsXtD9izjyD3lTO2lq2DOq30ktlOU7LC8MRehJ
         7Eo8l4SRwlsnUD/kMgdDmrCq7GKFnylJ0OO1nMuinVEFY0DzfppgzbbuwNY4Irs1Z5C7
         8BiA==
X-Forwarded-Encrypted: i=1; AL+hErEx4e6WUVdxF2nEkJJqeegqOIqfN8DPjsd+t2Jf5jPV0gF6PR/56RZN4xSTVbLuURyQ/+6fTPU=@lists.infradead.org
X-Gm-Message-State: APuU4Z/Wn+GUX69MHN75nZrcOozf5gcdArtZMMz6thvmev+36k3YbhNf
	PEfIYE39ancRWDxYu9+w0LKmJ4jDbiPQKYVPfleuTlF/AKW6mvRyZ2/ab9wDXQ==
X-Gm-Gg: AYBFou09dgeA4An0fk5hEj3Vx6Np01v0AjqYHMx0qIk8yVoK1hDk3qPYZD6DZzCPQMH
	gLU5rjF5HOkUesA9gfkRYrR8JaQj5ncwS67fEYcAW9IqE1WvhR6IIQalxZxD9ajwRUNvukbNdki
	NAI9XAC5N1t7zbBzrQ7aSzjZU4RPHi4X7IpiBqOTBudyCOJt0fVf4bF3yi8vdq24LjIMr2+/k6c
	tiRJorOW/5JXQMauLgCYDMrerUd80tmldEiT+ImJmlXTW9+u8HLKN9A6TVS4z2FzRELvM/l0TbZ
	yPF1uPoOuCk4ZQh4daZV6iglVY0z6Xx54drcPeyrpdXF86lkpANExPxAq6skz2fgpwIX1rBOy6C
	5urcCxcrShcQDT2g2JyOdcxqmZkv4Qe0WNyP871+OwVx6icLh2uJYddwTAkAzzOF52ynIt8s93T
	MzGHsNZEV3fajtr6CbWgFH8EdFifTheDAPJ0O+nf2xI0FW/1NFZx0Jpu+vYga1uV2EG+coEDKvb
	6W6iV1VzSnI/jF1lOWss4IYJXGkxzB9DwAmhIbnnpFd46RsudsnoerGHn6gTxJMSMgx6WmfA4lc
	tJx8e2yBJD+N4aBG0SsXRUMVnqK0W4iEyKTlmRwotcnSItJaIxzB5KL9oM5GANI/+r9Dc6q7wE5
	cDAFTq2UFNqhTcdNIr+sYT81UwQrT1eniW6CDfRE+BTbcF7gj
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr140076445e9.34.1794826834356;
        Mon, 16 Nov 2026 03:00:34 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm168426655e9.2.2026.11.16.03.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:00:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 12:00:33 +0100
Message-Id: <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
Cc: "Jeff Johnson" <jjohnson@kernel.org>, "Filippo Falezza"
 <effeffe99@gmail.com>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
 <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
 <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
In-Reply-To: <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_030037_654797_0212084D 
X-CRM114-Status: GOOD (  10.40  )
X-Spam-Score: -2.1 (--)
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

On Thu Nov 12, 2026 at 5:56 PM CET, Loic Poulain wrote:
[...]
>
> The 100 ms timeout seems reasonable. However, will it actually help in
> your case? You mentioned that the failures are sporadic. If we happen
> to read the temperature at the "wrong" moment, is it likely that all
> three retry attempts will fail as well, or would it be better to wait
> a little longer before retrying the read?
>
> In other words, do we expect a short retry loop to be sufficient, or
> is the failure window long enough that spacing out the retries would
> improve the chances of success?

So from my POV I believe the driver should not do any kind ok retry by itse=
lf.
No need to add complexity. We (ath10k thermal users) already had to cope wi=
th
read failures.

So what I would do would is something along the lines:
  - if we fail the first 3 times we read the temperature, disable it perman=
ently
  - past the first success, don't disable and report errors like before
  - lower timeout value as this holds a lock for a longtime to no gain
>
> Regards,
> Loic



