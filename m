Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BEBC433F5
	for <ath10k@archiver.kernel.org>; Wed, 30 Mar 2022 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FindBbfIhHuN9/LHwLqaPiDsOdWqUvz9C6AzIoAuhig=; b=de5bPzefbl2Xvd
	uqs4tyKje6VCN5oWYeH0nmfAf42KEzqx9ZMLEIl2iMb2m51Sv+XteuYb7MJH3TcCflz2/feMOtN0C
	kYn8kfvO5uSwaJY0NWqDlpAQINVMUllvp1HO5AXhCHiJhgylVv3xcStwM3WlOFfck/p0R74Gp/xVx
	vnErgVWPA+h4dI6ZsBZSGxsP7DSd/2/+BlVyyBljvMJZB5pWchjlrtPOr6yeEEaQ6fm1JBglmxJkL
	2dGGiWoXUgE5fG+CRnfHei+1t7xGZa/B89P9piDhVDzULSDLbKnrJEyHXWSPauvtyHaSlgdjYKA1F
	POdLP1yhJ2rMhdjX15Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTTY-00EjXI-AO; Wed, 30 Mar 2022 08:14:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTTV-00EjVe-Br
 for ath10k@lists.infradead.org; Wed, 30 Mar 2022 08:14:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4A956181A;
 Wed, 30 Mar 2022 08:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2521EC340EC;
 Wed, 30 Mar 2022 08:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648628080;
 bh=+1RwX6F2j2MmjSrrH5cM4VGEZqDSuNw94o9ZslDfAYA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=F0/f8CFKAIBZw9LjCsmlMhK+db7ka4XQNkLqy1HDPw3QzJmvrqcAKLIlN+IAO/Fw6
 E7QRyokrLMWcoEYSIjh8lOXfHiTT3OVPhZqndyubtrKMM7slBfZjqiM+ra25X1zMgR
 x2Q62mZtuahBK2kE4g8usIXdnOd4/RjRziNXIjalnYZQcW6T6Nhp+Z43BKuJyk536G
 TkCJ7cRFmKywcwebg9BJ4iaAOg11/ZClNlMkQSCxswYLmLKsSoQuCFs3M0EBOGH38B
 JWBkPaYKz2NZajsugiBwC5mq7elCayfWWL74tVHJnj6MuU4prfY4jGrx81b48NXF7G
 Tc4AqRYGtVWqQ==
From: Kalle Valo <kvalo@kernel.org>
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 davem@davemloft.net, kuba@kernel.org
Subject: Re: [PATCH 1/2] ath10k: add support for MSDU IDs for USB devices
References: <20220327171340.7893-1-erik.stromdahl@gmail.com>
 <875yny1w8t.fsf@kernel.org>
 <1ca2ff88-4751-acce-6202-abc7d22e4494@gmail.com>
Date: Wed, 30 Mar 2022 11:14:35 +0300
In-Reply-To: <1ca2ff88-4751-acce-6202-abc7d22e4494@gmail.com> (Erik
 Stromdahl's message of "Tue, 29 Mar 2022 18:00:06 +0200")
Message-ID: <87lewrx3f8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_011441_503623_AF5071EA 
X-CRM114-Status: GOOD (  11.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> On 3/28/22 07:28, Kalle Valo wrote:
>> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>>
>>> commit 93bbdec6683e1c8ba2cc4e6 ("ath10k: htt: support MSDU ids with
>>> SDIO") introduced MSDU ID allocation in the htt TX path for high latency
>>> devices. This feature needs to be enabled for USB as well in order to
>>> have a functional TX path.
>>>
>>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>>
>> On what hardware and firmware version did you test these patches? I'll
>> then add the Tested-on tag:
>>
>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag
>>
>
> Hardware: Linksys WUSB6100M
> Fw version: QCA9377 hw1.0 USB 1.0.0.299
>
> Above fw version is printed by the driver at startup:
>
> ath10k_log_dbg: usb 1-3 firmware 1.0.0.299 booted

Thanks, I added this:

Tested-on: QCA9377 hw1.0 USB 1.0.0.299

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
