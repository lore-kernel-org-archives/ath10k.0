Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF1BC54798
	for <ath10k@archiver.kernel.org>; Tue,  5 Mar 2024 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zwirrf8wPgoSCPKi2Ry9tKgv/K7swTtD68L+AY8rEg0=; b=bRWeCzZSG3EjkyPEKMVjKXwAkO
	GdVB6h6kwU1anlpAeDqyosoqIQ06NqYROdmYdHB8H8am83spBNpbqnScSA/Ov6KeL8I7C6igXURuw
	h3suOfXibfO5TlhCkjlLygO4c4Vs+j/XVqdai5TqtJ1ZdQ+jLPklCDSES79eLxuHDnMiHymOUNxCf
	MjfDgWPVLN+wF0LzziL5TPuBtNZJXQKdneKH1wd0CPH3Knc4CnJqyPs3YdGnj3U7HaauT/NvRSNjf
	gbyqT6X+/d1Le6TJY6Nb2XcWpOKk8GuAk8UdqZVp7F3TvFrNYg+QHGO81xFQA02Ml5zYJslR2MiVe
	dcnZ9HnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhW3P-0000000E6DD-25XR;
	Tue, 05 Mar 2024 14:46:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhW3M-0000000E6BL-0jIs
	for ath10k@lists.infradead.org;
	Tue, 05 Mar 2024 14:46:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FF06CE1C42;
	Tue,  5 Mar 2024 14:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887A2C433C7;
	Tue,  5 Mar 2024 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709649957;
	bh=5G7PGZMu/aicnTYhUQekw8jRSJeEEv9A1txZjh/ZQaY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lGWKnq0wV1cArcaiC2IzwVjteX5G4wZqCSqTxVLf/cpk9GBnqCMW3KwK5rTcGT6bU
	 IYx0ZCL7h2tpD87hypAGK4hAqa2VIxSLFr0jy6brDbetzzDy+e7mQyEG3FEp+FpKXK
	 H+nit08zQDFy0jmjBgYYBRym2UryE6Rzuc979eVouGqJxn6RaX6yBdNnG8Qmkqr2jO
	 Z4QI4gN1zCgfScCNj9AEv4s6YlEX3RUuvpgxboIaaDd6kHJ1eHBKfhM8q/3aIrCKCH
	 0uk2S5D4bNjoR3Fe5D42ycNLoAlM+uLIDcBN3RZ7l5/wq4mw+gmFw1VujtvFPH9DMP
	 dsS55+2k6pCKQ==
From: Kalle Valo <kvalo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath10k <ath10k@lists.infradead.org>,
  wireless <linux-wireless@vger.kernel.org>,  DT
 <devicetree@vger.kernel.org>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Pierre-Hugues Husson <phhusson@freebox.fr>,  Jami
 Kettunen <jamipkettunen@gmail.com>,  Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
	<b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
	<871q8wk7o3.fsf@kernel.org>
	<3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
	<87wmqoilzf.fsf@kernel.org>
	<20240229-ageless-primal-7a0544420949@spud>
Date: Tue, 05 Mar 2024 16:45:53 +0200
In-Reply-To: <20240229-ageless-primal-7a0544420949@spud> (Conor Dooley's
	message of "Thu, 29 Feb 2024 18:40:57 +0000")
Message-ID: <87le6w7n4u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_064600_639145_B57A049C 
X-CRM114-Status: GOOD (  20.76  )
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

Conor Dooley <conor@kernel.org> writes:

> On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
>> Marc Gonzalez <mgonzalez@freebox.fr> writes:
>
>> > As mentioned in my other reply, there are several msm8998-based
>> > devices affected by this issue. Is it not appropriate to consider
>> > a kernel-based work-around?
>> 
>> Sorry, not following you here. But I'll try to answer anyway:
>> 
>> I have understood that Device Tree is supposed to describe hardware, not
>> software. This is why having this property in DT does not look right
>> place for this. For example, if the ath10k firmware is fixed then DT
>> would have to be changed even though nothing changed in hardware. But of
>> course DT maintainers have the final say.
>
> I dunno, if the firmware affects the functionality of the hardware in a
> way that cannot be detected from the operating system at runtime how
> else is it supposed to deal with that?

This is why we implemented in ath10k firmware-N.bin with all sorts of
meta data about the firmware. There are a lots of different ath10k
firmware branches and they have differences which ath10k needs to take
into account. firmware-N.bin tells all that info to ath10k runtime, per
firmware release.

> The devicetree is supposed to describe hardware, yes, but at a certain
> point the line between firmware and hardware is invisible :)
> Not describing software is mostly about not using it to determine
> software policy in the operating system.

For me it feels wrong to use DT for handling WLAN firmware differences.
For example, what if the ath10k firmware in linux-firmware is fixed? Are
we expecting that DT in existing boards is updated? But how is the DT
update going to be synced with linux-firmware releases? Sure, in this
case it most likely won't matter but as a generic solution this looks
very fragile to me.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

