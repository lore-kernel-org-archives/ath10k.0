Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9718AE81A49
	for <ath10k@archiver.kernel.org>; Mon, 16 Feb 2026 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bbySU2aY298dlatuqxfDkqAXu0CIdhl7AM1X7/ysfCw=; b=JfjSJ4LyEvQC1HChdPP19Ol3v4
	qPScnpewmPpnYjrzqP2zFR9Ies2WYKXdT/81nC0+eDNr/XE1pkIy+gobu9yc8iE0QZ+IRUw7dqJ6W
	O3tvQ8/npd87NocExGqfMENk9RYqIMmnOVL13BGpkhIviJGL+dc70fPiteY5NL8KMuEe+tKtigBBE
	X+esQgFZtmjHzgmyw9LTA5lQXTsyElVhVPImTlE8cw3WjDNF1nDVtebQDPYlbpbXG1e2xa9LwXkxJ
	+CYso4QOp09ExE/JNqgKLgViVvuISwmAlIKgbC2NOOaOKzgMb2mZoy3gSVlRJnBCU4Em0yR8BlGrR
	cuGb9JXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs22c-000000074IA-1NBH;
	Mon, 16 Feb 2026 17:05:46 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs22Z-000000074Hl-1f1O
	for ath10k@lists.infradead.org;
	Mon, 16 Feb 2026 17:05:44 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2aaecf9c325so23895505ad.1
        for <ath10k@lists.infradead.org>; Mon, 16 Feb 2026 09:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771261542; x=1771866342; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbySU2aY298dlatuqxfDkqAXu0CIdhl7AM1X7/ysfCw=;
        b=Gn+epDPcPGxUhvl8L8PMZge36XeGH14z0j+p/qOyz8EV+0FS6qAP3lwbrsw9on+OeA
         SBlLANgCYa1C5GHnlvwyVhXzyk2AX00sA4ygt3DAmHfm/b/u/FrlAQLNlbEEv3xiTQe4
         cSaZp1XrbElDF34eLw0hJ/ldH83ty+zzU6vhp0vCJfSNtA/ob3jvoX+/HHoh7JNF9gy6
         LPi2NLVd1v5y0eFlTg5fDWlIh7fuz39JFZgd1FLJBSOYzJ4sdfIhU9dQWefgS8sLse1L
         HVGMZRG8BvtBCwYp9i9idY2i3dWWUFYKzPM6Aur/LmIGMmzZkEKWAMsmUtt3OVqsqQFa
         15dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771261542; x=1771866342;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbySU2aY298dlatuqxfDkqAXu0CIdhl7AM1X7/ysfCw=;
        b=eLM/vQto2O5z/XNJRaU11Cm+0vE+xgPHkZkgJT9fxGakQsRq3VDxR9Gf6OkTYEspGW
         ZSbrNxpYUmNz87h8skLuqbqrXnY/SP/p5nbcox/1o/wUgZLmhZM6mk9uo0EzDxwTBjPv
         cGWR3uyLFY9/JpwkhW1cQxQvDRus1QfZCo1YlAaReAqVbq3/7CGzh9iFDcqX3zWtpEmr
         bY+KJyEFegseRe1EuLlgdg4hczwbwcd55xhnyZKC8wm2uMRxgqbnSYHmqPfqdINWxsYC
         oWXX+EJuQNMnsA02w1+cxUvm5h6iF2Fe8K0LW5QJVVr3XJI7sLntySMU8RwiAxBiHz7L
         awTg==
X-Forwarded-Encrypted: i=1; AJvYcCX9/mqdtnk/48LqlimjaTY8mfVFYLS9qO2mbIKLtsaWV5ib8QLpNykmxqqLyfHusPeiE+W4J84=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnAgMWqTPF5ItZEETig3A7wao7VvM8lukAfqsuasVZM/UuCG5N
	sVuRRWc4peGW9x+U1SvAP3c/yvgXBJf5ZtUmNSlLoYO6NLF/3+BJzi/c59Fk3Y/d
X-Gm-Gg: AZuq6aIoKqlVFeB8aKLw/KigcUzVesgW+aB51iDHOSGISo0uCxr+BhDdHWlWoW+9Ncs
	xs25MvEf48b28Yuurg7k4vN92Hf45oxE7eIKIzKXPgnsh8Ndu99zRLGftNs8mp8TtfS1Jk01AQu
	8tkzDx2l0GxERRA4kd/b6jO7yn9AO9jDVBf0ckl6AZoLhpa6ejfqBqlA4laQh5WRQR+Tg8FG3DC
	2Hgz2wRvllZxK0YtvllFDycTIwiy8fdfKkl6NFY2pXVo5AcEZ/mSokZPghO8J0lfIA2TQ0vaC3W
	1E97M2+g+u4BP6UIS5SbbokNuBlcQNjZKjYsNhWwu8Y9DEldHrEsfd/6CWntZEq7yBaPBvUwAJR
	DLDAB01vfiWS00sKO6w4mUmnPIU6ByxNzTojPQWatnLM8kdEXkPXREP8HxSeA/DD5DFLgn0ZTEo
	Qu7ZOoKR/ZkBzj6cs7CFDcV+WaV6qwotY440+lhzuMwZxqCMQKlP4rm8XpyQ==
X-Received: by 2002:a17:903:240f:b0:2aa:f5b4:9a2e with SMTP id d9443c01a7336-2ac97445ea2mr115082885ad.11.1771261542068;
        Mon, 16 Feb 2026 09:05:42 -0800 (PST)
Received: from [192.168.0.219] ([116.206.223.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5bc8sm75640325ad.60.2026.02.16.09.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 09:05:41 -0800 (PST)
Message-ID: <c7c5a458-ec8b-457f-893d-1c4b147ebb65@gmail.com>
Date: Mon, 16 Feb 2026 22:35:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Subject: Wi-Fi quirk found in Dell Inspiron 5567
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_090543_458274_F6CB8CB7 
X-CRM114-Status: UNSURE (   5.56  )
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

Hello,

I messaged regarding Dell Inspiron 5567 earlier. This is regarding the 
QCA9377 chips placed on these devices.

I fixed the issue using "pcie_aspm=off", and I can say that the ASPM 
configs of the Wi-Fi chip might be problematic on this device.

The reason is that *these laptops run Wi-Fi erratically if we don't turn 
off the ASPM*. The result is the overwriting of the dmesg ring buffer 
within seconds of boot and IRQ #16 being turned off for the influx of 
multiple correctable errors, which hampers the touchpads too.

What are your thoughts on turning off this device's ASPM by default? I 
will be happy to provide any details as needed.

Bandhan



