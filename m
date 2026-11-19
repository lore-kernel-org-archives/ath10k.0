Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D1A606A320
	for <ath10k@archiver.kernel.org>; Thu, 19 Nov 2026 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ouvj7PT0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JN1fs360
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=; b=ouvj7PT0OCpEMihAH/IGHIy+h7
	rO1hPZZIdPTU8vJalmbJDZK9tlutpFdE2ZKBLT7gR75L/jdW9zidsz8waHOJ4dLV9YU68f9Sr7F2I
	6CyR563lAhaAjDZlfgrlthqk2o4AmpgW6SqigE+EA6lfWwFhXpXAUU/qIZKDBos0L9jS/SBvRcvIv
	WsKb5EHbGoUOdOwGvmjeHetkcrK7PKPfO7UbAOSJhFyIWXbPXTHTpun1EjpJaEa0lEUNmYIv5Tqfh
	F/Lz52cmepMQE1FY2zWWnVitNnDoGLlSF166/9YsCzlThb4W3GWpnzdKSvc6evf7Lfp3M9Dn0TTYj
	HNdu8MVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3mg-0000000CNyI-2Pnu;
	Thu, 19 Nov 2026 15:10:46 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3ma-0000000CNuW-2hua
	for ath10k@lists.infradead.org;
	Thu, 19 Nov 2026 15:10:45 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-7cc91ddf447so932305137.2
        for <ath10k@lists.infradead.org>; Thu, 19 Nov 2026 07:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101039; cv=none;
        d=google.com; s=arc-20260327;
        b=hbJcucTHZxyf25NeSSbJpJ1ot7968woafCw923wjKJNcEfIWBVr9m5DSLtdJju6HZr
         cNgONUY3RzRd+CWx5B5x/Bfs/c++9bmTolVTUP/g3TU/alKaPLV5atL3MazFcOE5lvt+
         NTKINBedbYAt5GDXGpguXBSTzmiEOrOTaeGZcD1M12n8ObcRJ2W1+DfzD/GZZZft6FHN
         xufOR4Ay8QZXurwvmB7vnqhaXCSTSX0cwWgNN6NYIKQoobjj+VS+Uc2nWzKc4XRWIols
         touOkZ/NUFCBGAQA34KkO1hKny+9IIjy+1Vo3K/R7c1i6wKDJFY291tLjEYOoWowpG54
         o0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        fh=+QGsjCQFU2tbppsKDPcAYokMK6U5adzz9xrM7ymwrvY=;
        b=BCzgpijfg29Yz5IU1GBHgh3Oeu5ogjswjfhMEq2OS9VHttZ4+n6KNqCmo8QtIRsz7P
         Y4D3nRrMM/LmBh4wVydnCoHPtdBhNzdKddpxdobx9RNC4LQV08NP2Zo6+39VFnKwGnTJ
         QfFyr9oXg0npVDl726AiiE/8YLSRz0tSHNraVITpAjruIUtnSA9/kk/uC8/JaV9chk5Q
         qSm0su0xgb1bW2sUharRag4eV5pmYCakuIVWRvw/ybkvkr1WXZDMDWEZV/fJKtMucx93
         uESrLNBNA94wlubFTgufykNYmbbg9nas5f3P7ue4bx78l5ENdcRPloC3eq2F7QyQ7LU/
         n4NA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101039; x=1795705839; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        b=JN1fs360vGue0AaUkdbpTJFeVQKcxpMKEP9U8j0/5xbwgl8HSyyO+IHpXkk9B3YRlF
         CKQdVOaNQPndOtRJvuk89qQnX0QtTJqZQ74qtnHbH3b77QfczSBkjc3HyXU9EZ1yj/tR
         mHCRSWbM3v54YPR1Jx7T6JwWTUoUDuHP/RwO0wvluVZUvUfA64IwEAaKvXqcby93FRIU
         5+1L87HbLnuoeKfd+Yq5GRs63UNB4hHd6deycemMrk0Y3/xybJzmcUq3w6Q3Xob7ljRA
         a4crVRYCOL1Ctx/u/9rOlfCE7wV8W2XL0UhbcWiFnIK8oEkw34qwTndsRCzjngNdE6Cp
         DaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101039; x=1795705839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        b=zlprHq94Uu4QTrIAVYYMV+AlYFk4eWgvyX9ZLAlThxXdA2gZTXe0myYJnkQBLTuelN
         M56P9GJMhdn75XAsFQIYtxVux2lgaweu6ECVOSVpMTnOARhnzHdWfVtJf1USc6+bSvFR
         y0hSbj1FgRMM81ZSJML6bG/Z3ChJUlr17oo4JMnqG61hZznnpMra0vob3KaHKc0Jnn6/
         GDlWwrI49kFY9ETwUFOxzpGyHndTeJSK3kQmcHVZGq2NzkHzidYWJ48TEx7UXIAmreas
         r/37y4k3gtmx/alJEYoG2/D+4QpY90fJJh6Piuok93zFiqUfXfWosRqX7ia4KaUjSoyo
         esLg==
X-Forwarded-Encrypted: i=1; AL+hErGLbMHpYNai0AdEaaUildvzK3BVibCC5AM8PXfzZwoC5Qo7b3P/a4RqJFtHk4HbfbuOEyQYD2M=@lists.infradead.org
X-Gm-Message-State: APuU4Z/a94hDrVx1FOeqI4rMqA/GS8suGFyTombpJaWcw6/TUVIeMhFt
	nwTZObygQ5w2VMW5oTwwaz4oS1tsuj4M2AVGeOLwtkEjbTh1NOEXAhDlmUt3rppfrOVAK4ZOQ/Y
	Lv9laep+NOEPBx2JgG6s1Y7Iho92/MgGVFIrPKuEcSw==
X-Gm-Gg: AYBFou0Rco+q5vTboL+xW/0gRyMz5t1OZtjRA6EnsxjrcY7ADX7XL14aDQ+6M/dEhDh
	I3CMVvfd75dR+pmUaJKI37HJqELh2+lQj+iErMmJEUX7nUTq4/I+jRky1Ku03IvKHrR7TvBZJbG
	dcepQNBwlcDk3I1KE94ABS+7Q7fy80ohUgjO9PMiw/zeoMebfcyB0K5KCXBW7Vm5Pg/OQnc4UmJ
	nSWureRuq0Am1w6OE53w3fcxB3iMNlVo00QSvmHpPfgHuTMzil98Tmd0xj4At3LJnIn842+7kiZ
	CDAoPHFMNUDPsmbkYwzmyd/SHXcx4325DgZifxBSDLkWvPkDP5HU63sdpPVdzvaBSZ+zA1whZPq
	ZbZ9qVCKiaSk+AvNj+13dhBfDGeWHtFug6vHwsbiKAQhFR7g8DZvmmYsMnyRMO9PdLlrUqDjwtM
	4SzA==
X-Received: by 2002:a05:6102:548e:b0:7d2:840b:b064 with SMTP id
 ada2fe7eead31-7d6ba18e430mr2284058137.3.1795101039217; Thu, 19 Nov 2026
 07:10:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
 <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
 <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
 <CAKobHXCMwjAHJOkibPbpDByLZmAKkszZ3WaG6soSDaCEGRQjgA@mail.gmail.com> <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
In-Reply-To: <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Thu, 19 Nov 2026 09:10:25 -0600
X-Gm-Features: Aa3M54pZaHP6ysBEqmdFQebPmeAF0kkje7A47NLqpnzWPq0PTLeUQa2a-UgopI4
Message-ID: <CAKobHXCUawNNtyLn-n9-qXV3F_q9drWXeG28bY5ARiiTLzXO2Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: loic.poulain@oss.qualcomm.com, jjohnson@kernel.org, kvalo@kernel.org, 
	quic_haric@quicinc.com, quic_vnaralas@quicinc.com, quic_pradeepc@quicinc.com, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, quic_mkenna@quicinc.com, john@phrozen.org, 
	ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_071040_768005_09F2E3CD 
X-CRM114-Status: GOOD (  16.00  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 5:47 PM, Jeff Johnson wrote:
> Please don't send HTML e-mail.
>
> Note your reply was not archived or sent to the mailing list because it was
> HTML. I only received it since I was directly addressed.

Sorry, Jeff, and sorry for the duplicate: my last resend went out as
HTML again. Plain text this time so it lands on the list.

On Thu, Nov 5, 2026 at 9:53 PM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
> It looks more like a theoretical issue than something that is likely
> to occur in practice, but the fix looks good to me.
>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks for the review, Loic.

We did hit it on ath11k, and it did damage: on a QCN9074, a firmware
crash failed a scan start with -110, the timeout was armed anyway, and
it fired after the dead radio had been unbound, ending in "cannot queue
ath11k_scan_timeout_work on wq" with a garbage workqueue, and a panic
(that is patch 2/3).

Whether ath10k ever hits it I don't know, but the code is the same, so
the fix can't hurt.

Christopher Griffin

