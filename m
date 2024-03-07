Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4815C48BF6
	for <ath10k@archiver.kernel.org>; Thu,  7 Mar 2024 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4rA7glPrCrKwr981a28u15ca/pzff2LojpS0g84uXI=; b=S735u6xM5+oI3Zw4fvUtdSRo2A
	NeAc2rNPjvEKpsC1UyXoati0DZuv9rTkrasP1SX5JrmvtjyhWMC65BOpTbsSg8V1GWka3KGAFI+to
	JoRPdmdAN+LqnHzzMdlm14pvHsnyXVV50MSGGiZ7iLFBh/YdGs0hvEQdgkRXpmgUJ460EXwTQd3Ny
	AjhDPS4edor7hEX9TywIFEE80btO3ElgDRVCbfCHyOXnpmzsMLtrua8H6D1XnslORyd6uoLFe/aN4
	PdGPIm/zBUPuwNJd8KZ3uj+FMRzXunQccIFlXWa58Psdm1wL6nCyjgpLSWqkfbH3JQAdR3VwXL70w
	h7mYo++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFgf-00000005HOv-339s;
	Thu, 07 Mar 2024 15:29:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFga-00000005HN1-0pL9
	for ath10k@lists.infradead.org;
	Thu, 07 Mar 2024 15:29:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-412fc5f5152so7953295e9.0
        for <ath10k@lists.infradead.org>; Thu, 07 Mar 2024 07:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709825368; x=1710430168; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4rA7glPrCrKwr981a28u15ca/pzff2LojpS0g84uXI=;
        b=V/RqiF2IrRD5k1AMPjFbJGYWRRMS+5y37Nv89/R8RHYDM0zHVMfHpE9ddnQ0kY+cEw
         IyCK5wHR5UcH7FMz736JL8wqP2jmTm7eDQjWfyHmuq2kwgj1uOPQsukQoRS0fH6c//QE
         yo40uhbss+l57x0fmZBsplv/dtI44TB0zQU9K4ID+C9wsLNKWtCN2jgkv3VtscYTtMF5
         MgIro/1Vdl/86FQKjCxFWldObvBWanr/OYQjd6yMylvfpg/yxY3NWOIrdQYQ09XyJuzS
         vRCB4jsQPjcu2WPYgz4Fa2SoIcdDvJgVE2VQAEF1mf44vfdwtv25NelVBrUEBHdt8u4T
         jgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825368; x=1710430168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4rA7glPrCrKwr981a28u15ca/pzff2LojpS0g84uXI=;
        b=QJck0GamZgKFZQPBy87beZcuFEJdBG22iSNZyLXXtGO2ou8x5jAVcP8YBStvjPbnbH
         bc+dys5lJPyikMLwLnAjeHTA7td/+h7wNfswfFNdYAcLu3A4Xh7DwTOyyiww1CA34Z72
         NbsQ35qqq7g2q6alPQ9WUWSKnGWYVpHG8u61QFtFcbGHBBDjF0QvFLGCEAbRTe5FoARA
         mNdcF4jtdXp9rJwoVlQ7p7flHokaZwV7P7ykcxScGmZZ3RL5JYCrVIYkOTcFcI34jlbP
         AJ9IVnMNeDYkWvwln28oEzkRS0Gara8KFJfqB7sMPvHeyY+aQhkcLQa/SZAo9t5CuvnY
         rkMw==
X-Gm-Message-State: AOJu0YyEVzW4oYrO5vNzZU2tPzu66jE9e5XkVCIyyZnAnzkO6tzDTgQV
	kfCEvSXmAIoGHBk84DEnjDzkM5TjIDYAx7DQsQRTRvCz1s8CO7NqJm/Zvc5mk1Y=
X-Google-Smtp-Source: AGHT+IGEMjZrwSX4KlE3+S4Mx14JfUgPt2iuZklnN3V5j7oUm9gfxTUCLTshjWeoxPKz1UsSxB7+iA==
X-Received: by 2002:a05:600c:450e:b0:413:1013:cc7f with SMTP id t14-20020a05600c450e00b004131013cc7fmr1576665wmo.29.1709825368172;
        Thu, 07 Mar 2024 07:29:28 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id w14-20020a05600c474e00b004131310a29fsm1366528wmo.15.2024.03.07.07.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 07:29:27 -0800 (PST)
Message-ID: <2f588948-0261-4985-91e8-d5060e673cd9@freebox.fr>
Date: Thu, 7 Mar 2024 16:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Conor Dooley
 <conor@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud>
 <c48ead11-0e2a-4066-b324-84f802215c9a@quicinc.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <c48ead11-0e2a-4066-b324-84f802215c9a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_072932_390991_ABD1DEFC 
X-CRM114-Status: GOOD (  16.88  )
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

On 29/02/2024 20:46, Jeff Johnson wrote:

> On 2/29/2024 10:40 AM, Conor Dooley wrote:
>
>> On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
>>
>>> Marc Gonzalez writes:
>>
>>>> As mentioned in my other reply, there are several msm8998-based
>>>> devices affected by this issue. Is it not appropriate to consider
>>>> a kernel-based work-around?
>>>
>>> Sorry, not following you here. But I'll try to answer anyway:
>>>
>>> I have understood that Device Tree is supposed to describe hardware, not
>>> software. This is why having this property in DT does not look right
>>> place for this. For example, if the ath10k firmware is fixed then DT
>>> would have to be changed even though nothing changed in hardware. But of
>>> course DT maintainers have the final say.
>>
>> I dunno, if the firmware affects the functionality of the hardware in a
>> way that cannot be detected from the operating system at runtime how
>> else is it supposed to deal with that?
>> The devicetree is supposed to describe hardware, yes, but at a certain
>> point the line between firmware and hardware is invisible :)
>> Not describing software is mostly about not using it to determine
>> software policy in the operating system.
> 
> FWIW I've compared ath10k to the out-of-tree Android driver and there
> are discrepancies in this area. I've asked the development team that
> supports ath10k to provide a recommendation.

Hello Jeff,

Have you heard back from the dev team?

Do they confirm that an issue involving missing MSA_READY notifications
was ever noticed?

What devices were affected? (All msm8998? A subset of msm8998?)

Was the issue eventually fixed?
(Probably fixed, otherwise newer devices would be affected)

-- 
Regards.



