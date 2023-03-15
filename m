Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0470EC61DA4
	for <ath10k@archiver.kernel.org>; Wed, 15 Mar 2023 04:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+Pe3CembT6cUN5LUygJmWOPgt2S66fyjPZOYkvTHNQ=; b=N4wWtmLWXwUw1S
	USwYo1ksuQ8U3/3cfOR9fRTNy0hAq68yi6U8Ils8WQqVtLT0w6bYKVVKtreoP4D5Hg+Lcmee6TyXi
	TZfqa2TAwo6NkLcRTVQ+n0clIfWEITS2VqLp7UQ4/NptL4K9pVRhr9BMdxocfmaSOJKWoStHYF6ed
	kzwkCvE7xRV+63za7oa6wD4UwTHW+G4JshK+WeQ7Pd6R/Sqzig/+Sk5tFwO5LJPp2CUxucDk0MBwi
	Kebk+FnSUlr70OS9i5XESOqg0EURQsQq4XgqwnuBlSbnyYEbxPXGCSLKq1PlQ1fNESX/zLZcnynsK
	ta79jz878K2CzYF8Fe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIkG-00CHEv-2R;
	Wed, 15 Mar 2023 04:28:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIkD-00CHEF-15
	for ath10k@lists.infradead.org;
	Wed, 15 Mar 2023 04:28:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 89B6AB81BBD;
	Wed, 15 Mar 2023 04:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC318C433D2;
	Wed, 15 Mar 2023 04:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678854486;
	bh=LAK7Ux218jJKDKVTmRf0R9iRAT4prcpZ1FxGOQoWDwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Meg8cAsSQxJ7QxAuSZLPP3N2IuvTug41TVw+4NUkBgdNygxnFtsRmCtn/OOC6i1AA
	 tENroIg/6Yu2qFS7vMD2C7KdJMIUajdU65LKHg1rZNYqJVyf12remllOOELwcqkWwM
	 edNvhYYOcqd9SpbyhnoxGx2zG8UUj7Jiy0mqO640=
Date: Wed, 15 Mar 2023 05:28:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bjorn Andersson <andersson@kernel.org>
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
Message-ID: <ZBFJU3Lp4+/EgSr5@kroah.com>
References: <20230213181832.3489174-1-quic_eberman@quicinc.com>
 <20230213214417.mtcpeultvynyls6s@ripper>
 <Y+tNRPf0PGdShf5l@kroah.com>
 <20230214172325.lplxgbprhj3bzvr3@ripper>
 <bdda82f7-933d-443b-614a-6befad2899b5@quicinc.com>
 <2ae96b75-82f1-165a-e56d-7446c90bb7af@quicinc.com>
 <20230315041119.fp7npwa5bia5hck3@ripper>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315041119.fp7npwa5bia5hck3@ripper>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_212809_667708_52F61C14 
X-CRM114-Status: GOOD (  32.52  )
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

On Tue, Mar 14, 2023 at 09:11:19PM -0700, Bjorn Andersson wrote:
> On Fri, Mar 03, 2023 at 01:09:08PM -0800, Elliot Berman wrote:
> > 
> > 
> > On 2/14/2023 10:52 AM, Elliot Berman wrote:
> > > 
> > > 
> > > On 2/14/2023 9:23 AM, Bjorn Andersson wrote:
> > > > On Tue, Feb 14, 2023 at 09:58:44AM +0100, Greg Kroah-Hartman wrote:
> > > > > On Mon, Feb 13, 2023 at 01:44:17PM -0800, Bjorn Andersson wrote:
> > > > > > On Mon, Feb 13, 2023 at 10:18:29AM -0800, Elliot Berman wrote:
> > > > > > > The maximum VMID for assign_mem is 63. Use a u64 to represent this
> > > > > > > bitmap instead of architecture-dependent "unsigned int"
> > > > > > > which varies in
> > > > > > > size on 32-bit and 64-bit platforms.
> > > > > > > 
> > > > > > > Acked-by: Kalle Valo <kvalo@kernel.org> (ath10k)
> > > > > > > Tested-by: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
> > > > > > > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > > > > > 
> > > > > > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > > > > > 
> > > > > > @Greg, would you mind taking this through your tree for v6.3, you
> > > > > > already have a related change in fastrpc.c in your tree...
> > > > > 
> > > > > I tried, but it doesn't apply to my char-misc tree at all:
> > > > > 
> > > > > checking file drivers/firmware/qcom_scm.c
> > > > > Hunk #1 succeeded at 898 (offset -7 lines).
> > > > > Hunk #2 succeeded at 915 (offset -7 lines).
> > > > > Hunk #3 succeeded at 930 (offset -7 lines).
> > > > > checking file drivers/misc/fastrpc.c
> > > > > checking file drivers/net/wireless/ath/ath10k/qmi.c
> > > > > checking file drivers/remoteproc/qcom_q6v5_mss.c
> > > > > Hunk #1 succeeded at 227 (offset -8 lines).
> > > > > Hunk #2 succeeded at 404 (offset -10 lines).
> > > > > Hunk #3 succeeded at 939 with fuzz 1 (offset -28 lines).
> > > > > checking file drivers/remoteproc/qcom_q6v5_pas.c
> > > > > Hunk #1 FAILED at 94.
> > > > > 1 out of 1 hunk FAILED
> > > > > checking file drivers/soc/qcom/rmtfs_mem.c
> > > > > Hunk #1 succeeded at 30 (offset -1 lines).
> > > > > can't find file to patch at input line 167
> > > > > Perhaps you used the wrong -p or --strip option?
> > > > > The text leading up to this was:
> > > > > --------------------------
> > > > > |diff --git a/include/linux/firmware/qcom/qcom_scm.h
> > > > > b/include/linux/firmware/qcom/qcom_scm.h
> > > > > |index 1e449a5d7f5c..250ea4efb7cb 100644
> > > > > |--- a/include/linux/firmware/qcom/qcom_scm.h
> > > > > |+++ b/include/linux/firmware/qcom/qcom_scm.h
> > > > > --------------------------
> > > > > 
> > > > > What tree is this patch made against?
> > > > > 
> > > > 
> > > > Sorry about that, I missed the previous changes in qcom_q6v5_pas in the
> > > > remoteproc tree. Elliot said he based it on linux-next, so I expect that
> > > > it will merge fine on top of -rc1, once that arrives.
> > > > 
> > > 
> > > Yes, this patch applies on next-20230213. I guess there are enough
> > > changes were coming from QCOM side (via Bjorn's qcom tree) as well as
> > > the fastrpc change (via Greg's char-misc tree).
> > > 
> > > Let me know if I should do anything once -rc1 arrives. Happy to post
> > > version on the -rc1 if it helps.
> > > 
> > 
> > The patch now applies on tip of Linus's tree and on char-misc.
> 
> Greg, I have a couple more patches in the scm driver in my inbox. Would
> you be okay with me pulling this through the Qualcomm tree for v6.4?

Please do!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
