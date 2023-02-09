Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9F8C05027
	for <ath10k@archiver.kernel.org>; Thu,  9 Feb 2023 04:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqWOJ8cad+dIgeDb+qO9X7+ruwiN4Y4W6Ko8mQg1I70=; b=nVUQtuRygj9w39
	cLx0aOEDPwFf6s73cIoIZLIiuHV+ZEe3PLCN+PWw4L3M1MfHNIMyqDP94CAuyqjhS0akLKTebbY2g
	2yhkmHW+zh+KE6VlIRfSX1+rxxzX5lxqy0liJTKUq9h6LzF26yFD3g/p/DtmyUW86ke9lU/ZtKp4o
	S3UXi5mLvVbmW8YlRPULydQ+jKfA7Kn0HvINmkPz3s/HfAIRVTQPZVbMBRixwrDG2AtVdowmw4UGA
	6t/9smeDAvr9pxupyAko3tIYw8AXmcQJM2dQNHTdKlAOcMkNi+YmaRbIcBSFu6EbMmLETiuE9PsgP
	4lC8reimW/7QgSx9wm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPyRs-0007KV-0g; Thu, 09 Feb 2023 04:22:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPyRp-0007JM-8D; Thu, 09 Feb 2023 04:22:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C70DF618A6;
	Thu,  9 Feb 2023 04:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1454C433EF;
	Thu,  9 Feb 2023 04:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675916532;
	bh=r896al9/ic3TVzWhQihrH5WWe9yq5i1aPuOB0FJblUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BN/W1fmhyUDYnWQNFRl0yiZAlLtkPZOeM9PRJliT8ril6wiUbcRvBv1HMVz8E0tvT
	 mbyq5LYLXG+Q0iC3FE+j8oPN8wrX8CzcUUbhXZ8fLkv6SW7OFkTdgoSDQ4Z4S7676q
	 ekM+HlbJO6e1a7rJmpHX2uhrjQmq5U7OdTYpCuhnJvE8DoMV488k6BQ9GV5iJQMl+R
	 Z4eAbD3zOtPVRjxwl6mYHQRaDOaj1IjnIDvEt0MNJ02q3yVnhiKjhsmUqY3r16pJbp
	 2l1erYVmeAs/OrQ3L+bCLx5ypvDAgc3kGR5MyqzFDCB3QgSGPs4TzDKRQdWSO0Gb80
	 XNY+n6Qa5PJyg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andy Gross <agross@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Alex Elder <elder@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Paolo Abeni <pabeni@redhat.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Amit Kucheria <amitk@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ath10k@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom_scm: Move qcom_scm.h to include/linux/firmware/qcom/
Date: Wed,  8 Feb 2023 20:23:26 -0800
Message-Id: <167591660372.1230100.2523010471979974316.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203210956.3580811-1-quic_eberman@quicinc.com>
References: <20230203210956.3580811-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_202213_351635_72FAD3EE 
X-CRM114-Status: GOOD (  10.14  )
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

On Fri, 3 Feb 2023 13:09:52 -0800, Elliot Berman wrote:
> Move include/linux/qcom_scm.h to include/linux/firmware/qcom/qcom_scm.h.
> This removes 1 of a few remaining Qualcomm-specific headers into a more
> approciate subdirectory under include/.
> 
> 

Applied, thanks!

[1/1] firmware: qcom_scm: Move qcom_scm.h to include/linux/firmware/qcom/
      commit: 3bf90eca76c98c55c975fa817799789b9176f9f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
