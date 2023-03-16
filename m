Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F642C61DA4
	for <ath10k@archiver.kernel.org>; Thu, 16 Mar 2023 03:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJ8YQR6bZwZvRR+5LufMxtvm+Melsa+M1BHfjoJo1eg=; b=kXNiaFbao7V5Rj
	c2SaY5+QT9laKRj7Z/QK3ul0C9sG5tZZegxj3MZ2nfkUaIQlkpGCtiDMsiG+KMQApJ1Ztj0nu/SDz
	6Smu36rfR/7nNM1RWKbREqhL9I9hN+3tkuVOFYOoQT5mfG8jR/NJdiXi6UX6r+XSFVaxa86IjPdFx
	vwkACIbaYo1Jm7ULJkS3ZzHt2Lhgb7T7uCk5kVoM8ALH1ARnPOgRV/0YYLOmUoWe5bzJbPcEh70Hd
	JJwMvxT6Iii+DUOyX3m4PmzAak/L5WvivbbmudXG4e9t1OznR5VvSpSkGCP8ZoTYx8s8AAfr93wpF
	SskhD4cbwB07RoX4M/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pce7w-00F4mU-2w;
	Thu, 16 Mar 2023 03:18:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pce7t-00F4kZ-1g
	for ath10k@lists.infradead.org;
	Thu, 16 Mar 2023 03:18:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2724AB81FB3;
	Thu, 16 Mar 2023 03:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18ED4C433AA;
	Thu, 16 Mar 2023 03:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678936679;
	bh=2veV2xaJf5ssmKjUauZ5Y3zT1WI8lFivE+RzW+XrW8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IgiEX17qXBlzGAT4MGrFiIiNc79cEJRT3pJMPA6RlSqTKlyam6YYSapyvm/k+Ulqa
	 oaRkKDgO5rh1ADhCRN1sPDNOfmzDp6H7q03xgU9UM6z7rF1aIhJdB2grVRXc813c0G
	 X+8Q2ZyN0ZebnFvDJJqZUDpVnOgu6oW2M+PVR1xyFpo5t4IFwjHBWW4o6mAuagEMLR
	 5wNumIklIdhns3yyGDNFgAAPvE4YOAGv6TxCm/QkQ6BWvDJQdLyAGcvzJ0og4Rq4ib
	 ZjIDxNILAa0LKrB9zikjbLJlW+XvEtt26vRyRCPoKEANnV5R87/uarcdfAtBqTgPQj
	 HAXAjHnLtsxSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Subject: Re: [PATCH] firmware: qcom_scm: Use fixed width src vm bitmap
Date: Wed, 15 Mar 2023 20:21:01 -0700
Message-Id: <167893686409.303819.14364343251308679131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230213181832.3489174-1-quic_eberman@quicinc.com>
References: <20230213181832.3489174-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_201801_701258_51DA707B 
X-CRM114-Status: UNSURE (   8.46  )
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

On Mon, 13 Feb 2023 10:18:29 -0800, Elliot Berman wrote:
> The maximum VMID for assign_mem is 63. Use a u64 to represent this
> bitmap instead of architecture-dependent "unsigned int" which varies in
> size on 32-bit and 64-bit platforms.
> 
> 

Applied, thanks!

[1/1] firmware: qcom_scm: Use fixed width src vm bitmap
      commit: 968a26a07f75377afbd4f7bb18ef587a1443c244

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
