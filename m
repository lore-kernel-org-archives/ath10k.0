Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C501C87FCB
	for <ath10k@archiver.kernel.org>; Wed,  6 Aug 2025 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzGjuxWtKqcqG7Rp7vG/TfgqQxO5U6u2y+XzK2NJAO0=; b=gQF8M2kd7DZ9e42XU/RcqREAMP
	yYxCSOBxgtoCgd5dd6Qg6WNzYCrnB+h3VxeyRhrO8f7Ujvb3d6GtIFD3hPcgNQI2j+ybSVe4/99fg
	xDfZ+EYqdu0KUE5GDjzYlIs8OlYJAmJsa2uhoUuf50yEspMPKTtY2gqTyWxtIMVPQNPnlCrpVWub7
	tdV5tADuHEy0An3k3I5ZCOntWHKy61MYMA2pLD+cX7G9OfPQFCGg/7lKfS8kl2gMhk4wUK4+Ary18
	AWseL8vZpAP4hROnF7viC1Gpa/3rDQu3n7UiXGSAbEurWJGXV0EIcaVA5YPmQXTdWiIBjSm5gCYba
	a2q/hE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjim-0000000GC46-1Y4w;
	Wed, 06 Aug 2025 19:22:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjf6-0000000GBcV-2B3v
	for ath10k@lists.infradead.org;
	Wed, 06 Aug 2025 19:18:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so2433575e9.1
        for <ath10k@lists.infradead.org>; Wed, 06 Aug 2025 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754507935; x=1755112735; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzGjuxWtKqcqG7Rp7vG/TfgqQxO5U6u2y+XzK2NJAO0=;
        b=lbFYAjoDm08bHrGiJZluMPe6eViSrpJS6WiP97wc6f/BrF3T9cDcqS6yUADC+Zh09f
         as4Up/rmceqR0Rlac7WoxbN8gV1I6KZUXzvR4vw1Fa1eVsDjJsrFXI8W4xgjgOKecIy8
         AObD52E6++Jxl3IGQvINCMV902cjQAt9x4mm9rdl0rp5/GcR9/uRsW6S+gEEoMf1ivRx
         U5zFP2AmIJP3Kv/MjkwCgtTO3DGzDOuOUkRrR+glbBVIyEaqpkQeMd79ukd05pQ6k+9G
         ILAWpicGzeLq+3fPkTPxNYvcrcZi+Pipn0ONigwvD3goLRw12OC5T33t8crFBKstc//x
         UkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754507935; x=1755112735;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GzGjuxWtKqcqG7Rp7vG/TfgqQxO5U6u2y+XzK2NJAO0=;
        b=pl83fB8gsPBkAsEmCk3hcFlasGC4AKR8L9zHkNPfyxqWkSFWrnm1FpdWqE7mdtpf6Z
         i34XAZ0Np3NA+K/mkY9MEuP/gtL2WYHsldMYfZ7kQs3LW/XwQBPZqbGW0o+c5zzLBOVU
         YRD07dBlUz7AH9MkCkWF5gBcWJ3/1RLVb6i1XhIAvoP1kryi6c5IN2WiAfwoa2RjmMA/
         DbNtu76b5IiYfU7t1VhZEck/75TQY5sA/N0Wr5iKwirjbfp+lr3AenOaDSfiWceU9xzv
         5ha3PZ3KGMjlUu1GRPaaPrs4BTZty3K3yvycGn8KyEwuBCH9wIyDdQYjZBEb5TczTqqI
         NpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3HNbTbFBHm0dRyGzm+zNTn9sAKGoJmEef1OHXElszY3vu0PXeOw9qDYUQZ8wIkeAm6OOS7Cg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx+M4PGtbhoHTJmdunKDuyecvDY84SQWpEcAgudpZZPItAkE3A
	UFPsYwFKZ2Rz4G5cSQhVeZtWCUeerytHoeCdoxO6s4vHXL3yHmhD/8WnYi5xiQ==
X-Gm-Gg: ASbGncsogPtuGiSjf1VHvqZGaV162n9V+hBewm6eLoEC2bOup/xCbZiag623Uuzd7X4
	fxk9aN5bOpnLPi88d5KhlA/1StI6lh+gM6UISrivCAm+s5Uk+N3B+TwRClXd2ZlCt0XSYA1RlCA
	18XIcVBbhEB1faxTRm5MKlx0wfUbonlsi79ThNE8Ahh2Cc9k6fVrvMKiedKMk0jC4YNxnFmPMQO
	evJDMKRk7ntoRJfKNZA5WJ0gJuQDPa7QyJxpWiWHZp6BCcWK5dm9XHd+1sAn6vH/4pUvIMvJejq
	mGYSnkNC6Fcd0pl4wauflALaKEV1ufZaN25WkVUPj7guremO6Ci9XSGvi9H+NK4g9On8tX5+M59
	PfPq0EYekZEGs7/0gxSWOpRBgsPYk2v2XLlvkkbIu
X-Google-Smtp-Source: AGHT+IHxvW57SiNdcyvgwfl2jMzjM6r+hMeiGssjjfrnWxRobn0puQ2J2xbPfNosoXmndruPed/DSg==
X-Received: by 2002:a05:600c:840f:b0:456:25aa:e9b0 with SMTP id 5b1f17b1804b1-459e745c61amr42860255e9.16.1754507934546;
        Wed, 06 Aug 2025 12:18:54 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453d6esm24091921f8f.37.2025.08.06.12.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 12:18:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 21:18:53 +0200
Message-Id: <DBVL5LLQ6PN7.3UAL98HQ7TMIU@gmail.com>
Cc: <jjohnson@kernel.org>, "Remi Pommarel" <repk@triplefau.lt>,
 <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>, "Loic
 Poulain" <loic.poulain@oss.qualcomm.com>
Subject: Re: [RFC PATCH] wifi: ath10k: support flush_sta method
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Zhi-Jun You" <hujy652@gmail.com>, "Jeff Johnson"
 <jeff.johnson@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806070005.1429-1-hujy652@gmail.com>
 <29ef8aab-06a3-48e2-a370-86b1b2107143@oss.qualcomm.com>
 <CAHGaMk_rMCoWDzKtxgsg9GkH0s-U540zYq_AOC9HpBo_JF7qJg@mail.gmail.com>
In-Reply-To: <CAHGaMk_rMCoWDzKtxgsg9GkH0s-U540zYq_AOC9HpBo_JF7qJg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_121856_559079_F5235281 
X-CRM114-Status: GOOD (  26.70  )
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

On Wed Aug 6, 2025 at 5:51 PM CEST, Zhi-Jun You wrote:
> On Wed, Aug 6, 2025 at 10:23=E2=80=AFPM Jeff Johnson
> <jeff.johnson@oss.qualcomm.com> wrote:
>>
>> On 8/6/2025 12:00 AM, Zhi-Jun You wrote:
>> > When a STA is marked as no longer authorized, if the driver doesn't
>> > implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
>> > flush hardware queues to avoid sending unencrypted frames.
>> >
>> > This has became a problem for ath10k because ieee80211_flush_queues()
>> > will stop all traffic and call ath10k_flush, which waits until the
>> > whole HW queue is empty. In a busy environment this will trigger a
>> > timeout warning and stalls other STAs.
>> >
>> > Fix this by implementing flush_sta method using WMI command to flush
>> > frames of a specific STA.
>> > Flushed frames will be marked as discard in tx complete indication.
>> >
>> > ops->flush_sta will be set to NULL if htt.disable_tx_comp is set to
>> > true.
>> >
>> > Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00157
>> >
>> > Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
>> > ---
>>
>> There is already a patch from Remi pending for this, see:
>> https://msgid.link/cover.1732293922.git.repk@triplefau.lt
>>
>> Please see if that series addresses your needs.
>>
>> First Kalle, and then I, held this back due to lack of internal validati=
on
>> across supported platforms, but it is actually still on my TODO list:
>> https://patchwork.kernel.org/project/linux-wireless/list/?series=3D91185=
1
>>
>> Let me make one more validation request internally since I know there is=
 at
>> least one ath10k-based project with active development.
>>
>> /jeff
>
> Hi Jeff,
>
> I am aware of the series and glad to know it's still on the list.
> I did test with it but the warning can still be triggered easily with
> the instructions in Remi's series.
> And according to other people's reports it can still block sometimes. [0]

Well that's to be expected with this implementation and the use case descri=
bed
by remi. You have a station that is out of range or powered down without te=
lling
the ap, and you wait for the firmware to tell you that it did managed to
transmit to the sta or that it has given up transmitting. So clearly you wi=
ll
have the warning.

The goal was to not block trafic pending for other STA when that happens.

What I recall, and sorry if this is vague it was quite a few years ago, is
that when issuing the WMI command to the firmware to drop all frames for th=
e STA
it just did not, and it was still trying to transmit them (checked with ota
capture at that time). But I do not recall if the firmware tried to send fr=
ames
encrypted or not (as we would remove the key right after the wmi command an=
d
before the firmware had given up on transmitting the frames) which was one =
of
the reason .flush_sta() was added in the first place I believe.

>
> drv_flush_sta() is called before clearing the keys and Remi's approach
> still waits for the frames to be sent which imo isn't enough in this
> situation.
>
> [0]: https://github.com/openwrt/openwrt/pull/19427#issuecomment-310279479=
3
>
> Best regards,
> Zhi-Jun You


