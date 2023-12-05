Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBEEC4167B
	for <ath10k@archiver.kernel.org>; Tue,  5 Dec 2023 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9UitNIdbrhGwooOt/QBvSOh+P1TAzgKbuijAIGnWKA=; b=YvgaH6y94lWxWyz5Fws3+YGQJR
	jow0+PInupiAPZS5HbcauQ7EkDcp5l5WQGFwa4jLKoehvn27VcKjRJ8LlIl+3cCbCWNutI7q2jCuz
	Q7DHh1p3sdVs9dUXedKqVO2GRoeuQOS9d2XWq/6F8BlRaAYL+SdqU+b5nqNj6yE5AFq0rcidwvzbz
	MHW7TpZfkry2AHFsjrqFHSKgNE7eDbTjPyjKc17Y11+i/t4eVWuKa7c0Zfkb5OI2+NtOo4z0eEVR8
	cyNhd1UrXhkXYQRw33LRR+cdaGztYpJ92EquVxIup6RblJ5pFnnNBXXn5XW0a1jhmv1iEgUxAwYU7
	C0aY4iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAXL4-007l3f-1R;
	Tue, 05 Dec 2023 15:27:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAXL1-007l1u-0T
	for ath10k@lists.infradead.org;
	Tue, 05 Dec 2023 15:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8EF27B81AAA;
	Tue,  5 Dec 2023 15:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BC4C433C7;
	Tue,  5 Dec 2023 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701790072;
	bh=ombZDzMaoX08v30FB7mD3sP1qHxKoXQdX0hgGl58V3o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nfpLwMkvO1AI8LVy2HHXeKsPX1NZW5gb1gnM37n+x1pDoZA8pAYJCZBj5qJqnXFzZ
	 VhZS5Ck7+FxpY/SpYLZ1PuJDrvM1/UDi6YircYs//rU4PiO2mxioymfXQmONMZyCqe
	 IxJ6x8kSASxIyQlTwc9AOnpYlEHO70Xj8iiDo+FjkoMbFsQjmC1uV5iNSZy9htyrpU
	 xWdjRFuumqphqdUG2BIqsldMt4pijojFvMgjpd0NTXzX95gnc95k26vpHbd7HJVfd3
	 lbZAzjbtL2o2gwaDLynWa/CdKUWoXIyqCTW8lrVWdaC7aclqhLi7zSBgNp9oQPHmL5
	 vCW0YT+k/aOOQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: James Prestwood <prestwoj@gmail.com>,  <linux-wireless@vger.kernel.org>,
  <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: add support to allow broadcast action
 frame RX
References: <20231116173246.40458-1-prestwoj@gmail.com>
	<be472f3f-c1fc-4ab4-acca-1b1357c8b407@quicinc.com>
Date: Tue, 05 Dec 2023 17:27:50 +0200
In-Reply-To: <be472f3f-c1fc-4ab4-acca-1b1357c8b407@quicinc.com> (Jeff
	Johnson's message of "Thu, 16 Nov 2023 12:05:31 -0800")
Message-ID: <87il5cpt3d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_072755_328406_6571668A 
X-CRM114-Status: GOOD (  11.88  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 11/16/2023 9:32 AM, James Prestwood wrote:
>
>> Broadcast action frames are needed for the Device Provisioning
>> Protocol (DPP) for Presence and PKEX Exchange requests. Currently
>> just ath9k has this capability so this is being enabled for
>> ath10k (for at least one hardware variant).
>> 
>> Add a new capability flag in ath10k_hw_params to indicate support
>> for receiving multicast action frames. This bit is then checked
>> when configuring the RX filter and (if set) multicast action frame
>> registration is enabled.
>> 
>> Until more hardware can be tested only the "qca6174 hw3.2" variant
>> is enabling this feature.
>> 
>> Note: I went ahead and removed the 'changed_flags' mask operation
>> since it had no effect, that parameter was not being used anywhere.
>> 
>> Tested-on: QCA6174 hw3.2 WLAN.RM.4.4.1-00288-
>> 
>> Signed-off-by: James Prestwood <prestwoj@gmail.com>

[...]

>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -381,6 +381,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>>  		.hw_restart_disconnect = false,
>>  		.use_fw_tx_credits = true,
>>  		.delay_unmap_buffer = false,
>> +		.mcast_frame_registration = true,

I forgot to mention that I prefer explicitly setting the false cases as
well so I added those in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=51daeadfbecc13b2ce8a9a4b7697e4056cbb358f

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

