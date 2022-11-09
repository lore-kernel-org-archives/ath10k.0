Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4021C433FE
	for <ath10k@archiver.kernel.org>; Wed,  9 Nov 2022 07:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1PbcGT6uaD3R61EXn/eudeEMpK5NJms5C9qbKonFMc=; b=s26dnxwW3F+MYe
	/g1yeDGlG8NZav1iEw9lQ19mGV+arYOL2VCJ/cdcHA9TENiy9v/HELIR4HenoJ2AyjFIPIqtYhDMQ
	nEWTPS3Z9stq05jkiw56tGi0zWTEYLrhYVm/k7L0S6ux4KZaX9J66WODnfiaG0tLswUGo0fiHCuBz
	Hw8vw6sBkAIdkyjZ61rD7yJ3F3ddM0lFa4LGnhw1vnOPUUjiQq+jyY5ZF2uuxRn1WNtju50cmoPYf
	28wZMLE0S8c+vd4Lee8+abz2DxiwxQDnJaxjDuPdRn3g0A1LrdOCYvhSHvGjgoG8ipmSruQCJqpP9
	b3m2jqiuBv5agRynRJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osf9u-00BXQP-Hd; Wed, 09 Nov 2022 07:06:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osf9s-00BXPh-C1
	for ath10k@lists.infradead.org; Wed, 09 Nov 2022 07:06:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54836618CF;
	Wed,  9 Nov 2022 07:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C707EC433D6;
	Wed,  9 Nov 2022 07:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667977549;
	bh=Pr7Nlg8rzM5DMQTnGQUaJ0OFZ8L5YL7zgieimDIg8Ac=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Z48EDSAhGIzO9GoFiVNVW3TcU7Q4DUPzzzYyzhKrS2aETzancleDdohim883xUFoI
	 JohA8B+/tVz0cOhzzkKnHjuhUuvFoifan/tNijWb1zoYT/5WHvDdITqCXElngoglWW
	 LqotSoiBI2qz9aFh+zjaB/tEQhY34oGOR39KVXcSTapxP9JLSon6gKvklkWekxdVdL
	 cCg7Ly4ql7qYqzQHnJppYLiGV7Le53zB03dRP0/GWq0qErtUoHFrvi9eYDTJHWCep3
	 fVo3MqdgJOhVwiU33XYS3/0v7x8qj6w89yNdOMvn6dU+sZJUYJz6oMZPtdIi0xWche
	 fGTmTqEfVg0rw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: Use macro for seq_ctrl conversion
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221106162227.1119-1-hujy652@gmail.com>
References: <20221106162227.1119-1-hujy652@gmail.com>
To: Zhi-Jun You <hujy652@gmail.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Zhi-Jun You <hujy652@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166797754658.13342.14024033967389199102.kvalo@kernel.org>
Date: Wed,  9 Nov 2022 07:05:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_230600_475475_433BF10E 
X-CRM114-Status: UNSURE (   6.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Zhi-Jun You <hujy652@gmail.com> wrote:

> Use IEEE80211_SEQ_TO_SN() macro to convert seq_ctrl to sn for better
> readability.
> 
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a60c04017298 wifi: ath10k: Use IEEE80211_SEQ_TO_SN() for seq_ctrl conversion

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221106162227.1119-1-hujy652@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
