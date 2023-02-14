Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871C5C05027
	for <ath10k@archiver.kernel.org>; Tue, 14 Feb 2023 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zvbFC0QNFmzjS4JncfAKhOv8ExNyGGzbrg9cJcagqE=; b=bUV9gubh/6AAP8
	nHIdoYQS5HiVHH+BMaPNL19SCH3ki6WUPQTxD+LltIdyaMs7qo2zl6vEoE0v/ycHknftBGtzzlIPu
	gGyucRErNbwjidJdwq9YiLfWjsSwnXH842eHmWq4gXOXnFn/N7Ls1Y+azPYNTRGjXGXNkb+70CmpV
	OHW37yGrSRUyaBXXsmuW8DokQEk0pTXywXA0YybN+Mbs+Oofult5PyIbMnR+3u3cCAMEycOlttCcG
	YvNQF6J9P43PSPiQnggURMvr6naYd3Dou+Pbb6aIf4uUe2CfcB+f+t3LQQsStvJVVHiqkAxgTw9wX
	W6e9mbMDt8e1xXae6how==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRyzg-002zPm-6F; Tue, 14 Feb 2023 17:21:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRyzc-002zOG-PM
	for ath10k@lists.infradead.org; Tue, 14 Feb 2023 17:21:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48DE9B81D68;
	Tue, 14 Feb 2023 17:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5362C433EF;
	Tue, 14 Feb 2023 17:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676395282;
	bh=PqGwx2dYT6XLwA/BD+6gzTUQqPBIcR94mqfkmP5SHjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWFtBcpAwOCoI2UGwpVx7yeWqM768vkfp0VCzVWKa0QyqGW14iJFwovPhiW5v3avR
	 SZp0Ls/sziy7Gc9Sz35ffictb+hZ8u+FjSV20nA9gi3OkhbryERqI4Z9FJ64TBSgZ2
	 bsf7rbsuBdJaGCKKqOr4+Xb4kZn27d+X3M/Qv2+2Muip0+ueICVVTXnnS1alg0RUxs
	 DOfWrTBU5YYLHPUEfpUcyhO+3CrhO5+P+3IGIArTK7QeK1wA+eY6CwAuk/NHVtLAAB
	 +2ce18ol06uxO4HHiKu9SeZHNxkxVgKlPZVO1gu8kd0aNMZ8esV3oyrPhNCjWdg4QR
	 Vf3NZ+lkmPqGA==
Date: Tue, 14 Feb 2023 09:23:25 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom_scm: Use fixed width src vm bitmap
Message-ID: <20230214172325.lplxgbprhj3bzvr3@ripper>
References: <20230213181832.3489174-1-quic_eberman@quicinc.com>
 <20230213214417.mtcpeultvynyls6s@ripper>
 <Y+tNRPf0PGdShf5l@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+tNRPf0PGdShf5l@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_092125_135271_75095D7F 
X-CRM114-Status: GOOD (  21.16  )
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

On Tue, Feb 14, 2023 at 09:58:44AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 13, 2023 at 01:44:17PM -0800, Bjorn Andersson wrote:
> > On Mon, Feb 13, 2023 at 10:18:29AM -0800, Elliot Berman wrote:
> > > The maximum VMID for assign_mem is 63. Use a u64 to represent this
> > > bitmap instead of architecture-dependent "unsigned int" which varies in
> > > size on 32-bit and 64-bit platforms.
> > > 
> > > Acked-by: Kalle Valo <kvalo@kernel.org> (ath10k)
> > > Tested-by: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
> > > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > 
> > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > 
> > @Greg, would you mind taking this through your tree for v6.3, you
> > already have a related change in fastrpc.c in your tree...
> 
> I tried, but it doesn't apply to my char-misc tree at all:
> 
> checking file drivers/firmware/qcom_scm.c
> Hunk #1 succeeded at 898 (offset -7 lines).
> Hunk #2 succeeded at 915 (offset -7 lines).
> Hunk #3 succeeded at 930 (offset -7 lines).
> checking file drivers/misc/fastrpc.c
> checking file drivers/net/wireless/ath/ath10k/qmi.c
> checking file drivers/remoteproc/qcom_q6v5_mss.c
> Hunk #1 succeeded at 227 (offset -8 lines).
> Hunk #2 succeeded at 404 (offset -10 lines).
> Hunk #3 succeeded at 939 with fuzz 1 (offset -28 lines).
> checking file drivers/remoteproc/qcom_q6v5_pas.c
> Hunk #1 FAILED at 94.
> 1 out of 1 hunk FAILED
> checking file drivers/soc/qcom/rmtfs_mem.c
> Hunk #1 succeeded at 30 (offset -1 lines).
> can't find file to patch at input line 167
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff --git a/include/linux/firmware/qcom/qcom_scm.h
> b/include/linux/firmware/qcom/qcom_scm.h
> |index 1e449a5d7f5c..250ea4efb7cb 100644
> |--- a/include/linux/firmware/qcom/qcom_scm.h
> |+++ b/include/linux/firmware/qcom/qcom_scm.h
> --------------------------
> 
> What tree is this patch made against?
> 

Sorry about that, I missed the previous changes in qcom_q6v5_pas in the
remoteproc tree. Elliot said he based it on linux-next, so I expect that
it will merge fine on top of -rc1, once that arrives.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
