Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFCDC87FC9
	for <ath10k@archiver.kernel.org>; Wed, 30 Jul 2025 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vouVbFy9H2IeEfXvCQei0Ugeqqqv+KVoaiQc9t39ZLw=; b=NfdLhn1SYhRFKA+/ffC11bk55T
	z7WBVYtIT4PImNFUlb6KbMb0zhCgDC0SCkXli/yIBJiYXwD12nop3VqcvZ1AEe6s0HT1ynSYJg5Wr
	cRlzNhQiE8qYo0PfXZfw8zCTbCM+UmyY0kOJ7c6V5FLrbD7+h6RKK2qkd0gjoyGiqBYRL86jg1Yp3
	6ip/c8EzEUvLq5OMPmF852Dd23iyEUUvq9uCUPK7RdOvDFIt5OR/n+pRyIsewqiyVVbYRnEXhgKtU
	c8QYQdNGZny1zjYmYD1WhFxx1DUvFk/zGeZoOF482Sj09CLcbeOFtdur1gReYrmfTJ0TYw+PCbf8N
	M+gI9GCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2To-000000011am-11F0;
	Wed, 30 Jul 2025 08:48:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2Rh-000000011PW-2TUc
	for ath10k@lists.infradead.org;
	Wed, 30 Jul 2025 08:45:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b78310b296so329810f8f.2
        for <ath10k@lists.infradead.org>; Wed, 30 Jul 2025 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753865156; x=1754469956; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vouVbFy9H2IeEfXvCQei0Ugeqqqv+KVoaiQc9t39ZLw=;
        b=LlyMA0OAnzt9jA/kLVM9WMknpoQ3ScwlX1D4yPacnMycIitxMv/G8i7e11aupwJMvp
         Xz4q1EfptLj9/K1SfAOzoF4eLftoUhJESd5eyIpmkI3WQoDMzRLh7y2+uLYnSvkQOS40
         OzEzd9B2m9kLAzUWQjl16IkG8TPGJONzOzvNM8i9UusPOIEzTIVMxW0OHTwn0F4AzwWQ
         3KJVV4OzUvqzz5X5o0ckNDTcexHMxzhVh29eskEdh2NYk8q/xtU7BK9orWN25wQFg7Ec
         /koVd+HBZNkZbOsqzZyYpU5E1JMAe30MKs/o5X83YxUKUPKPPMCV+VuTg3FiciNip3cM
         srRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753865156; x=1754469956;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vouVbFy9H2IeEfXvCQei0Ugeqqqv+KVoaiQc9t39ZLw=;
        b=V4sO9/R/MOzLbihqVclFb1Xq85qB+MJ2DVtkzy3Ndnkvn9zJU+ZSYbKJT7jCLyMpDr
         Z8Y+1leNU2NGJ1FsAG1U/1t506fLgD30Z3J3SaAbEfZWXrztQSZbnrqc2gqIi+MEgDqf
         nUUwgi9+EyKMSGmOtAM8LV2jfiYLpg7/IgynUHOAeaoQbwcslwd3q0re/LZEZx/mGOEx
         qlt4AjossqyiKjKkWxvFs7vouQapna3w8Tg1XLjgQ4iW5PjD2BPbdQFFUkS/bC59Enwv
         pC8O7oS5+xdgmpT8UQ7OZ+mNElpntq06v6mi24iP/9ANPZzT9YWa+5aFUrPdU+wXyXOX
         rkYA==
X-Forwarded-Encrypted: i=1; AJvYcCXmq42xbCtAgQ/blSfk1PtmOODY0+npil2dwXzC/u1GXuUmiaRGrV68adQkl+UMiCT6dwRVbEA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYk+7H3j5NHfT62UjAcSolCPxRF95gLZVaS4pyblV+5MYEQXat
	P7pHpUSlnfRV6zvo07uk4l9oQb59VFFYwoYinxNglGoOSJkYfOZ+4N6S8qrVkNsfClA=
X-Gm-Gg: ASbGncuN0m56v99SgKT2LP/qBRgsRmGIbDGz0j37dJBG2XJs0ZumUto2TG5ojhWSihD
	6pAHYT4a18f6DahOipCz7oaiP+mpFNK2tZiTJz5WHaZZfn9QD2evNQIBOu1HPQoCQ4TgAQnp+jU
	yL4TZqTFXedQ0SEaUOZM8bHTGZNTdIwvdCIku8lv/c4HPbOCusZjc524Lqbd0IpGsHgGrQnDVb8
	i4rfvhlTWCleDHOnvypV74qb9faDt4sVh3nEzj/c4WhKA3jHOxLcuSSZ2PkoIPlVa6/JptLsmSu
	7IwQGewS6gzEZbJnfmTlHt9znm14OAhl5pScwWwAzsDMHxLU04I7/7LV9C5W19MbCNF4mOemsb3
	Uq4lP21u6yqCt6oZl2fscYDx3lLPsb5F9MN3Owg==
X-Google-Smtp-Source: AGHT+IEsUJXHb9Fu+wIAFpOOr9CxkUbkz4FbUxP1vAkQqZyqMp+yCtAvMXAxm0CSLECgSmHegl1DYQ==
X-Received: by 2002:a5d:69d0:0:b0:3b7:899c:e88b with SMTP id ffacd0b85a97d-3b794fe4da0mr1639575f8f.11.1753865155466;
        Wed, 30 Jul 2025 01:45:55 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:2e51:f80e:a7b5:16f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589aefaa44sm9422155e9.20.2025.07.30.01.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 01:45:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jul 2025 09:45:54 +0100
Message-Id: <DBP9B4ZMXOMK.1QLITVTW393YI@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: <jjohnson@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <jeff.johnson@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
X-Mailer: aerc 0.20.0
References: <Zgp0ym-MGzX2eSZdlkVYbgvjkJ0CzKItjaC5pafzQnj1AOZnVAqvCIZfYoK7nwDhUgOA0U8eNolNtaWXbExOAQ==@protonmail.internalid> <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org> <5df11ee4-d645-4be2-841f-715343f1b7a4@linaro.org> <CAFEp6-0zwy2JdFOvRQ5ghMwD-J6b7F5YcVKNf-5R=8XdEpGDSw@mail.gmail.com> <CAFEp6-1wO9xwisOAtv6D__nb3Uo=8_f9rHifi-JAQ0oPD+JSVg@mail.gmail.com> <DBKDAXJ0V9U0.10YYX5H5HAJBT@linaro.org>
In-Reply-To: <DBKDAXJ0V9U0.10YYX5H5HAJBT@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_014557_634349_5F07F2C8 
X-CRM114-Status: GOOD (  12.56  )
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

On Thu Jul 24, 2025 at 3:50 PM BST, Alexey Klimov wrote:
> Hi Loic,
>
> On Wed Jul 23, 2025 at 11:42 AM BST, Loic Poulain wrote:
>> Hi Alexey,
>>

[..]

>> Could you check if this change helps:
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>> b/drivers/net/wireless/ath/ath10k/mac.c
>> index c61b95a928da..4fa7dd62aeac 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -288,8 +288,10 @@ static int ath10k_send_key(struct ath10k_vif *arvif=
,
>>                 key->flags |=3D IEEE80211_KEY_FLAG_GENERATE_IV;
>>
>>         if (cmd =3D=3D DISABLE_KEY) {
>> -               arg.key_cipher =3D ar->wmi_key_cipher[WMI_CIPHER_NONE];
>> -               arg.key_data =3D NULL;
>> +               /*  Not all hardware supports key deletion operations. s=
o we
>> +                *  replace the key with a junk value to invalidate it.
>> +                */
>> +               memset(arg.key_data, 0, arg.key_len);
>>         }

So far looks good.

I didn't see any kind of GROUP_KEY_HANDSHAKE_TIMEOUT messages and long wifi
outages leaving the RB1, for instance, overnight.

I do observe some packet loss while pinging the board for a while --
around 0.1..0.6% packet loss but that might be because of my wifi network
and absence of external antenna and it is still much much better than
default behaviour.

Could you please add me to C/c when you're going to send it over?

Thank you for looking into this,
Alexey


