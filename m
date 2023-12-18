Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5BAC35274
	for <ath10k@archiver.kernel.org>; Mon, 18 Dec 2023 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wNLORli7BDHo9r/kzrR/IxfZpnpeASnJ1nfAhIpnNE=; b=bnDjrFkaxwAxPxYo/IPv76aOAz
	gx3QlKEsRwk+4hKNr7moV9Lh81HHKytJ6gXsgJvbO73prXCKGRc2yWRf2UeSbzVzlq1q+9bkik3yQ
	StXOF4BqxI43qnExRTXLsA2Ovwe9GKdKWkN1xq1S2tkN1FG+wyX/CSbslbyXSdjy6mq7YwlRlan2V
	4M1vTKdmtxyW8cR9vL/vgfs2Kaw9jhoZXRyDi8/QLiNgdsUOANPa4vYOH7wPtfrWA9zxVlH0U5s92
	1tvsJNJ7NoSKXKbUSCJkJFOYXCeQqaAMxsdWtDuc9PyXGm3OPLmgM8a1RAXvUQRJkMDlqvtEhQgcp
	XAcQ5dHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFIeN-00BnT2-0E;
	Mon, 18 Dec 2023 18:47:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFIeK-00BnS4-1D
	for ath10k@lists.infradead.org;
	Mon, 18 Dec 2023 18:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2F7DFCE10BD;
	Mon, 18 Dec 2023 18:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79AEC433C9;
	Mon, 18 Dec 2023 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702925249;
	bh=MNFpGtT+UDTrh+CtH/56pWdeRMJBi6mOCBVEoln6zPk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=duhDDjH/pkjlzzSF5hSbzWfVyBHh5y4eEVQPfd8Ew+i34CDgDiqcdy9XYpKW8FK8x
	 pm9jt9QzWfC4TyqVDv9GJ09DigCsTkIfcegcBLCqKhGkOCDA1NQ1ZUU2t2w+8QdxsI
	 EC0ILgNSRzU4zpM2XhjjW2XejeKFyCh09+pj2r8XT8CMKnbsN4P5MUKND28vpHdt3u
	 VUxULwBDqNKChmhFVg7Gu/BcASIPx8tgwZ1+1cA+exEJ4mRQTK4pXwi35DGMVGtWRO
	 wEVKlFidpkQtdQHI7yBvvfmdBMvI3JdHdl+n7ipDCB25UoI1JOFzrMMJFsWfA+TC2V
	 NdSYAhAvCPU4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/6] wifi: ath10k: use flexible array in struct
 wmi_host_mem_chunks
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva"
	<gustavo@embeddedor.com>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170292524618.424292.1640750049894446616.kvalo@kernel.org>
Date: Mon, 18 Dec 2023 18:47:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_104732_665269_9CF7518A 
X-CRM114-Status: UNSURE (   8.31  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently struct wmi_host_mem_chunks defines:
>         struct host_memory_chunk items[1];
> 
> Per the guidance in [1] this should be a flexible array. However there
> is a documented requirement:
>         some fw revisions require at least 1 chunk regardless of count
> 
> To satisfy this requirement, follow the guidance from [2] and wrap the
> array in a union which contains both the flexible array and a single
> instance of the underlying struct. Since the footprint of the struct
> is unchanged, no additional driver changes are required.
> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> [2] https://lore.kernel.org/linux-wireless/202308301529.AC90A9EF98@keescook/
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

6 patches applied to ath-next branch of ath.git, thanks.

d2eb318f4b6b wifi: ath10k: use flexible array in struct wmi_host_mem_chunks
72ca7c4073ac wifi: ath10k: use flexible arrays for WMI start scan TLVs
26eb704a46f8 wifi: ath10k: remove struct wmi_pdev_chanlist_update_event
b0c0794b05ec wifi: ath10k: remove unused template structs
cb188e862c1c wifi: ath10k: use flexible array in struct wmi_tdls_peer_capabilities
6b9923f1f6d1 wifi: ath10k: remove duplicate memset() in 10.4 TDLS peer update

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


