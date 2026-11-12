Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3247606A8BB
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1FcRYjgu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LF06+O5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hY1mGgzLtxGTEpHomOXK1ai7FoNEbbvEwh94SK1e258=; b=1FcRYjguIHOrTE
	5ChYu+WMZ+tbVSnneK+q17Qc2QCXy/G1i5Qb1aALtYkzE+FHtDgZtaNbFwUhu1eESLC0QxYAKFYdD
	RmEo5DjAj84R7zjnujAJSPHaLzLFYJpNyshW6HWIqM4ddQimqZyjNBvF9gDy4AVqw18GERjkHVPP8
	gD7Cpvj7d1GPqq5iMozvRfgH9yHP6QfZi/aKiyfQRs6tIpYn9YyG4TFS8H/KokYFQSJpf6dVNslOm
	uajT4B8VQckGTJ4gZIxpYx97ULwyg1yVlWbOjQYHmKBZ3aGWRN9QXpAh9E9aVP50sn/VdG3IfEy5a
	5Ed0BXHVJziW5gxxpFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXwV-0000000AfM1-3QsY;
	Thu, 12 Nov 2026 16:46:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXwS-0000000AfLA-44AP
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 16:46:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so53664095e9.2
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 08:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501986; x=1795106786; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hY1mGgzLtxGTEpHomOXK1ai7FoNEbbvEwh94SK1e258=;
        b=0LF06+O5MWXw1dVmEq4LGtgE8XK8kaVD4uLnwDCwADp3xhB6SZ9A9PMbqA238vvWIT
         dle7aIGTD37PFFvyD6arfo1pACoIjjZ3XNZaXeLnmerlw/M3nFTM+sZzB76VP68/yw9+
         Vv8/A06CG0uv5GzloUtTe4v0rP+NsT7eh1zwvnauS4OIirLyDItz7GRzyQAAByewHdvM
         UvomO2izabRi5woDswtbkwZujaarVvsVdRuVNQRacC1Kq4e2SproNcqahBy483U8/SWO
         h1yTWowsfdGRSEfXrYrhjkAdIShKsWaysLeIlxApCra9+SE2guhFsbYxAt5vp5WAwB7+
         sUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501986; x=1795106786;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hY1mGgzLtxGTEpHomOXK1ai7FoNEbbvEwh94SK1e258=;
        b=AF8cj3pZ6NnewLQSagyxEcKF4/1aTBuItTuQZWtPHLaEkztm8A7UnAFKQCk1SWawX4
         cqJHQ4l5WvGYjO0o/wrujUlSO6yQSv6+a1N6M5LV7EifYT50MoC6SOBh4WdhavPLglIY
         fyygEGznLDISWxGYnWsW+ZvRBNF2VmRj/9b3iXTe8/tQuL/GQXctO3I1vCqV8A5sBvzx
         tc8LZy7h1wIf3ekSorcR3JOQTcoifDDw36szaOZnIJqyWDlji3BD2ILj1oH/osqVSDjw
         /mtfDG/f0w9gpMqyZlIciU2bpu3RvnheejvZwG84bnEVJszVLaKmtQbfbbVDrja8ly8A
         48Zg==
X-Forwarded-Encrypted: i=1; AL+hErGjoQQPWctEKNZg/ZDW8JRp5bLizK9FqYpq2W82GYObb8AlsUp47F8nCqkm3We8dL1/H0n2m98=@lists.infradead.org
X-Gm-Message-State: APuU4Z/M5ca+3lgNkr1BXUqz5ItnVgIQ4gZIlpDob6kzLOm1VwJ0y0uY
	HPvp/37HFNw+rJxf8sGuGPLDeJJZ8djGBi6mpSYjup1OQjkRXZ4m8ReW
X-Gm-Gg: AYBFou00Rwh1skZZCB1ypTzLPz6e7t4bBpTxB92uemjc8mW5ktRhbHajrO/x9lX0PPe
	OcRSEcx0UaGFU1hpAp93kAREWGPc2ilqsTvELFa5rHetsz2Q/W4WeDgJnv51iLq+cr4llkJNEAD
	QoiJSunQdGOkkGEeJq/EI9nYFwHJUZdmZk8x+9EioB2gQKNF+I3KnKPJObGQntdG4d78Vp6egNA
	lmIAgRuwkckkBIddI45edyTBwqlJ4BMrHu0Fk2Pm8LoTNnTGxusYWV793A2J6km3IhmCFl5vEJE
	52s1AGlY5gqoDaDaGV3yWQIhXwWC/CC1kxWvwjonysnZ8wQy1AqhuRln62vmykJFFH3TjgSo23H
	LOBWuvzUswaca+p/z1ZClRKxqkkPXhNyi5fMYBg6/EILeIjPSrT4/Gat3nzirqhWc1Wt70TD1b0
	c9XGgH4Ke+fKmeT/6ujFuwtZaRRebkdcy8MCKZoUCFgQB4tmvkQ+1ujm+O9B/O5aHiM8LQRLk/j
	nRd1VBQAlh748QYeTEbpvY1FINTYOgmbmCu1SfsUREb9bbYx/PtiXf78dwmq2f5n3WASSep2tt5
	/Ra52DZz7DTR5stIyXae0KSdAopC1oee3UZSlUi2HF4LMFb5Nyb6ooASp+Y2sBii8SVHzrv2mGD
	PWQ9OW50VfszJksEUpUzKWz5ydE9GPHkWSiiHchoQsJY2+mM=
X-Received: by 2002:a05:600c:a46:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ba093940c2mr113923035e9.33.1794501986335;
        Thu, 12 Nov 2026 08:46:26 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb551c6bdesm2154355e9.4.2026.11.12.08.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:46:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 17:46:25 +0100
Message-Id: <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
Cc: "Filippo Falezza" <effeffe99@gmail.com>,
 <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Jeff Johnson"
 <jjohnson@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
 <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
In-Reply-To: <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_084629_048933_DCD9DE17 
X-CRM114-Status: GOOD (  32.75  )
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

On Wed Nov 11, 2026 at 5:30 PM CET, Loic Poulain wrote:
> Hi Nicolas,
>
> On Tue, Nov 10, 2026 at 6:20=E2=80=AFPM Nicolas Escande <nico.escande@gma=
il.com> wrote:
>>
>> On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
>> > Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE an=
d
>> > waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
>> > holding conf_mutex. Not all firmware answers: the WCN3990 firmware
>> > WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
>> > codename nairo (SM7250) never sends the event, so every read of
>> > temp1_input stalls for 5 s, logs
>> >
>> >   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>> >
>> > and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
>> > lm-sensors, hang for 5 s on every run, and configuration changes of th=
e
>> > interface wait for conf_mutex in the meantime.
>> >
>> > Whether the firmware answers cannot be told from the chip: firmware th=
at
>> > answers and firmware that does not both advertise
>> > WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
>> > Instead, remember that the running firmware did not answer, and return
>> > -EOPNOTSUPP right away on later reads. Forget it when the firmware
>> > starts, so that a restarted or updated firmware is asked again.
>> >
>> > The first read after each firmware start still takes 5 s when the
>> > firmware does not answer. Reads on firmware that answers are unchanged=
.
>> >
>> [...]
>>
>> Hello,
>>
>> I've just now seen this and it will break some setups. It seems that som=
e ath10k
>> devices that usually respond to the thermal WMI messages sometimes do no=
t.
>> This is from a QCA9888 that does not have your patch yet:
>>
>> [431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal r=
ead
>> [433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal r=
ead
>> [434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal r=
ead
>> [435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal r=
ead
>>
>> Like you I have a daemon that reads the sensor periodically and it seldo=
m
>> fails to read the sensor value for whatever reason. Most of the time it =
works.
>> With your patch once I've hit this, I will never have a valid reading an=
ymore.
>>
>> So how about I post a new patch that only fully disable sending when we =
have
>> like 3 consecutive read fails, and in the mean time I can also lower
>> ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for too=
 long ?
>>
>> Jeff / Loic is that ok or do you have any other suggestion ?
>
> I'm not particularly comfortable with such a solution but since we're
> already introduced a workaround, I think this is an acceptable
> approach.
>
> Would it be possible to implement the retry loop directly inside
> thermal_show_temp()? A one-second timeout seems more than sufficient
> to read a thermistor but it would also be useful to include some
> information about the typical read time for this kind of request,
> along with the timeout change. I assume the actual read time is well
> below one second.
>
> On the other side, since you've been experiencing sporadic thermal
> reading issues, have you also tried increasing the timeout to see
> whether that helps?
>
> I think including these details and any relevant measurements in the
> patch description would be valuable.
>
> Regards,
> Loic

I think that what Jeff suggested makes the most sense. If we ever had a val=
id
response, never disable it.

I've tried in the past to increase it. But that leads nowhere, its not that=
 we
dont wait enough it's that it never comes. Or we missed it, I have no clue.

Regarding the behavior of current chipsets. Ive added code to time how long=
 it
takes. From before the ath10k_wmi_pdev_get_temperature() to after the
wait_for_completion_timeout() so my numbers are affected by the platform it=
 runs
on (cpu ranging from armv5 to A53 & A72). Here the numbers from multiple
devices each running one of peregrine/besra/cascade

=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
=E2=94=82  Chip   =E2=94=82   Mean   =E2=94=82 Median =E2=94=82  Min   =E2=
=94=82   Max   =E2=94=82
=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
=E2=94=82 QCA9984 =E2=94=82 88.9 =C2=B5s  =E2=94=82 85 =C2=B5s  =E2=94=82 7=
5 =C2=B5s  =E2=94=82 348 =C2=B5s  =E2=94=82
=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
=E2=94=82 QCA9888 =E2=94=82 148.5 =C2=B5s =E2=94=82 142 =C2=B5s =E2=94=82 9=
9 =C2=B5s  =E2=94=82 418 =C2=B5s  =E2=94=82
=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
=E2=94=82 QCA988x =E2=94=82 205.7 =C2=B5s =E2=94=82 187 =C2=B5s =E2=94=82 1=
08 =C2=B5s =E2=94=82 1193 =C2=B5s =E2=94=82
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98

So for a sensible timeout value, I suggest a few ms, even 25ms or 100ms to =
have
some margin. But maybe you guys have internal knowledge of the expected
response time ?

