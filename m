Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114E0C433FE
	for <ath10k@archiver.kernel.org>; Mon, 21 Nov 2022 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2WO6J7lDHHsg+4wijPy4G4WRDHBUGCBiiXBESEKn0g=; b=qdretvwQcwxnp0
	2fwCyga5Fjp3PGBPMPhM8/W5uY7VoZIstofB+R4zHNjdgsJ0gNwopegi+FCPEJk7m9Xg5qq806++3
	v6fCiZnP0sXfPYxVB4B3SoOwIupg7KRxrf6XJoCaBva2ggkgriKbe0QTVCl03fpLbFOu6Gw82pgV+
	iOP943yZ4xjRCsf/pQlf/P+vmrxX/cknpzGAyORglABkrv78heixoyjAomMUQJIVO2EfPySvMy6zn
	rUkg69uzjbciMbUio8WMClnSocnvm1Icz/dGdxcmfqGEUe9j+u+29LVRGfRYjfSEJzf9I+w24LWth
	kI6bPy2tKcwZNf4kO3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9Cb-00FT8e-2H; Mon, 21 Nov 2022 15:59:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9CY-00FT6l-LA; Mon, 21 Nov 2022 15:59:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3362A612E1;
	Mon, 21 Nov 2022 15:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5D0C433D6;
	Mon, 21 Nov 2022 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669046357;
	bh=NiniSOPGKqhdfVPafjU8CKNZvdS31QSh/55JMb9zJes=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=a/XuarW4mNIbqbd7XBC2KEovRFbFI0Cn8HGxor9WCskdjYW9wP+i33fR3L/YbBAdb
	 JBToPIO95id5D7gCvcI1UKdABittIPylI7B5C0y6Hje4bNLMt0kknKdWy+buSze5G9
	 QliJMfMVSnIQdSgDXwmkUS1hM13R1DgRGSb+XUj/7hFPpXMWf9akqhod1iCCCvar9d
	 wf8EVZWfUEKSZ3v+87b0ziwJPN4WP4ebWZBKxIyPpXNFnImRFbkEQT0yCxzrkgux89
	 +tVaefxhLXHps+kJrZqFWY9j4ZnjMk7f5mdKV3dvCGelrv9EcVOXYoH0jcZWaIcjDq
	 x5hT8nHQsCNNg==
From: Kalle Valo <kvalo@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,  Andy Gross
 <agross@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Konrad
 Dybcio <konrad.dybcio@somainline.org>,  Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,  Amol Maheshwari
 <amahesh@qti.qualcomm.com>,  Arnd Bergmann <arnd@arndb.de>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  "Jakub
 Kicinski" <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Mathieu
 Poirier <mathieu.poirier@linaro.org>,  Murali Nalajala
 <quic_mnalajal@quicinc.com>,  Trilok Soni <quic_tsoni@quicinc.com>,
  "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,  Carl van Schaik
 <quic_cvanscha@quicinc.com>,  Prakruthi Deepak Heragu
 <quic_pheragu@quicinc.com>,  Rob Herring <robh+dt@kernel.org>,  "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,  Jonathan Corbet
 <corbet@lwn.net>,  Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jassi Brar <jassisinghbrar@gmail.com>,  Sudeep Holla
 <sudeep.holla@arm.com>,  Mark Rutland <mark.rutland@arm.com>,  "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>,  <linux-arm-msm@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-acpi@vger.kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  <ath10k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <netdev@vger.kernel.org>,
  <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v7 18/20] firmware: qcom_scm: Use fixed width src vm bitmap
References: <20221121140009.2353512-1-quic_eberman@quicinc.com>
	<20221121140009.2353512-19-quic_eberman@quicinc.com>
Date: Mon, 21 Nov 2022 17:59:07 +0200
In-Reply-To: <20221121140009.2353512-19-quic_eberman@quicinc.com> (Elliot
	Berman's message of "Mon, 21 Nov 2022 06:00:07 -0800")
Message-ID: <874jus9u44.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_075918_755835_EC3F6BB3 
X-CRM114-Status: GOOD (  14.00  )
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

Elliot Berman <quic_eberman@quicinc.com> writes:

> The maximum VMID for assign_mem is 63. Use a u64 to represent this
> bitmap instead of architecture-dependent "unsigned int" which varies in
> size on 32-bit and 64-bit platforms.
>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>
> Note this will have build conflicts with
> https://lore.kernel.org/all/20221114-narmstrong-sm8550-upstream-mpss_dsm-v2-2-f7c65d6f0e55@linaro.org/
> which would also need an "unsigned int" -> "u64" in struct qcom_mpss_dsm_mem:perms.
>
>  drivers/firmware/qcom_scm.c           | 12 +++++++-----
>  drivers/misc/fastrpc.c                |  6 ++++--
>  drivers/net/wireless/ath/ath10k/qmi.c |  4 ++--

For ath10k:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
