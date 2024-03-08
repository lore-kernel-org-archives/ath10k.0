Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5131DC54E4A
	for <ath10k@archiver.kernel.org>; Fri,  8 Mar 2024 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JG7lawVO31Gwqx/ULSezAn2GCILIMLcMVh8ddUVruo=; b=yoezcJBUZlr1EpCA/RRS6Aot1I
	8Tchot59q/3pFKvjTtEOkvtvhn8Q22DRLxN7ENiMJIdmvGpzwrcCIZa3duzi5EZyGs8JkFqENwbg9
	Txr0XVMsIEu4Vz0M1jZsvFsiQDWI9jCVRWNaNHuemKevyWq7Qatc1gbHlRXd1inXJG697MBnBMX2d
	x5AfS8eS1S8m03D1iRGd/60jyyZstBmE3L/WvnVrzZfloUXGdy7pyfHyVTm5Oe7nX5UR3bwA9AL6f
	7PK4S6HGbS0Beyuz7rzvgVVjOUznsHUZLSOoIYhgRKHsPzZJYsVynZW9WE41x0TEg9xIkGuGsb6VF
	+IYwHN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ric0D-00000009oUf-2sSp;
	Fri, 08 Mar 2024 15:19:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ric07-00000009oTI-3SzG
	for ath10k@lists.infradead.org;
	Fri, 08 Mar 2024 15:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C622060686;
	Fri,  8 Mar 2024 15:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DDDC433C7;
	Fri,  8 Mar 2024 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709911150;
	bh=2aEWrJvvukoPuyYJLD9Zn0ge1MPAdinGfbWVtaTvHp4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=e1a/ZMv9W69wCrDHRgkvlZIa4zoUJ8J8Q3ymIbKisGFKt85jmdi8rfigpLWuxyFVV
	 0NMyFXtGSPpANaWp4n+9q7gax4lJv6/l/ymG2gcd8wjKVcn2OYjQ1nlW0pHBvhwvlu
	 1WSi0bGr3izdfGytW1OtnQXfBWA/rRrzf3KgYRsKCyT9k2R1DLweSj4xcahwGjiTPS
	 LCNlE5MKl+CpM8Enh+hZWwiAnV0G67ryNjl5C8rOiWaT6dXdIidkWXKtNY5hduirgp
	 y/3xoHrWixGF2LDAur5awj7cBiaNBTUXF9V3bqbfjuerY2BtKIJku2z3U6hBDIDv92
	 lL4q8dkNZ2MbA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-msm@vger.kernel.org,  Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific
 firmware overrides
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
	<87plw7hgt4.fsf@kernel.org>
	<CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
	<87cys7hard.fsf@kernel.org>
	<CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
Date: Fri, 08 Mar 2024 17:19:05 +0200
In-Reply-To: <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
	(Dmitry Baryshkov's message of "Wed, 6 Mar 2024 16:23:55 +0200")
Message-ID: <87v85wg39y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_071912_071306_43509FC6 
X-CRM114-Status: GOOD (  14.98  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

>> To be on the safe side using 'qcom-rb1' makes sense but on the other
>> hand that means we need to update linux-firmware (basically add a new
>> symlink) everytime a new product is added. But are there going to be
>> that many new ath10k based products?
>>
>> Using 'qcm2290' is easier because for a new product then there only
>> needs to be a change in DTS and no need to change anything
>> linux-firmware. But here the risk is that if there's actually two
>> different ath10k firmware branches for 'qcm2290'. If that ever happens
>> (I hope not) I guess we could solve that by adding new 'qcm2290-foo'
>> directory?
>>
>> But I don't really know, thoughts?
>
> After some thought, I'd suggest to follow approach taken by the rest
> of qcom firmware:

Can you provide pointers to those cases?

> put a default (accepted by non-secured hardware) firmware to SoC dir
> and then put a vendor-specific firmware into subdir. If any of such
> vendors appear, we might even implement structural fallback: first
> look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> finally just under hw1.0.

Honestly that looks quite compilicated compared to having just one
sub-directory. How will ath10k find the directory names (or I vendor and
model names) like 'Google' or 'blueline' in this example?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

