Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30474C54798
	for <ath10k@archiver.kernel.org>; Tue,  5 Mar 2024 19:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H41GTseSiIkWKpaVXadUAwV6MxZYWMtmkQtIU0X3sKQ=; b=dhIBQixEviFcfseplMbSGD88g6
	qyy2BjyMMMMPDOUjm+Y4u7hjOiVpgADAJ6nU+XhNt9LnfsmIf5tN7S4Vf1ml+BpL7yvyAe0b7VWmh
	b9Ixk+r7XyPNsFXHeK7KlYV/aXx+9nqeT3DAUapSpiUMMz+2TpnJJ09+sw7OMekwJbGvzN/lpwVts
	1phUcY9ou3Rza4jERPZYsEcGws0DNeb+SxmK2/DwG8XRd5QmSa+A6Ll5C/yzMhiSaQeFrMjMnPMOP
	/juUAYmCXGPk3BZ2e+PwnLjl3at0OgNU4/VT+g1CVt8NXH47nCj+u6rLGHATwlAGe8cPwOzCJI2Se
	zsB+LS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhaLZ-0000000Ezon-0hD8;
	Tue, 05 Mar 2024 19:21:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhaLW-0000000EzoG-0bee
	for ath10k@lists.infradead.org;
	Tue, 05 Mar 2024 19:21:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9527F6172D;
	Tue,  5 Mar 2024 19:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03ED8C433C7;
	Tue,  5 Mar 2024 19:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709666461;
	bh=jG8PjPDjHjrzDu50mfZQbgkQ+cDwgQ7Iq6c6nCmgzwY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kmbEN/QdufeshqadsHgjXE85SU3L0z8KHYggPny+2OevlwR1rTVgV4izDZkSg7jDy
	 AvLvND/kK6D2n7r8ZKDdUfPmZeZQSZUId0sIvZmHnUMHtklpj+b71cwtdL8Ao0IpWN
	 1lSEmghmvIMKt3osl/fCUkBO3UYwlY1Jo/yVJHIMJgr8xoFQWXH7pQVc6lK/Pj2sFK
	 WhsHrSEa01JM59SjumY/bwDWuhNggOdhwGQZdLpGtSBSC9MgdBG/c0FEs599QjWb1b
	 5hJifFFcfbXErF3xU4fwoHxjy0OHuqjEYjrLxlM7YVM9MX+AO1HOi33rP8XAjW+8bg
	 iyZfVC9hXj6Qg==
From: Kalle Valo <kvalo@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k
 <ath10k@lists.infradead.org>,  wireless <linux-wireless@vger.kernel.org>,
  DT <devicetree@vger.kernel.org>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Pierre-Hugues Husson <phhusson@freebox.fr>,  Jami
 Kettunen <jamipkettunen@gmail.com>,  Jeffrey Hugo
 <quic_jhugo@quicinc.com>,  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
	<b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
	<871q8wk7o3.fsf@kernel.org>
	<3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
	<87wmqoilzf.fsf@kernel.org>
	<c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr>
	<87cyse8j9m.fsf@kernel.org>
	<6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr>
	<87plw87nsc.fsf@kernel.org>
	<0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr>
Date: Tue, 05 Mar 2024 21:20:57 +0200
In-Reply-To: <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> (Marc
	Gonzalez's message of "Tue, 5 Mar 2024 18:32:20 +0100")
Message-ID: <87h6hk7aee.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_112102_315220_996967A1 
X-CRM114-Status: GOOD (  14.15  )
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

Marc Gonzalez <mgonzalez@freebox.fr> writes:

> On 05/03/2024 15:31, Kalle Valo wrote:
>
>> Thanks, this is exactly what I'm proposing.
>
> With your suggestions, the patch becomes much simpler:

Nice, looks good to me.

> I need to build a kernel + rootfs + FW to test the proposed solution,
> then I can spin a formal submission.

Yeah, please do test this to make sure we are not missing anything :)

> (I didn't understand why this patch requires Dmitry's series?)

Dmitry's patchset is needed so that we can have board specific
firmware-N.bin files. At the moment there can be only one firmware-N.bin
(ath10k/WCN3990/hw1.0/firmware-5.bin) for all boards with WCN3990.

Your patch can be applied to ath.git independently from Dmitry's
patchset but we need Dmitry's patchset applied before updating
linux-firmware.git.

> Do I need to submit a symmetric patch to linux-firmware to define bit 23?
> And also a patch to add the bit to some firmwares? (All msm8998 FWs?)

Me and Jeff can handle linux-firmware.git submission. We will also add
the new bit to ath10k-fwencoder.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

