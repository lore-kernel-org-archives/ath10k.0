Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242A606A323
	for <ath10k@archiver.kernel.org>; Wed, 25 Nov 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YCgSGcG0;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hS/j3m3N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXXsvC63
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=; b=YCgSGcG0lv1/SX
	nN/Roqi6cvXp084uGuZx1brJwFstoJxtbL89T/4TeVO4qqeiOGXDfaqKyYSwB1YDSZHtDbauxFgaZ
	HatP9uhmFvDIth8PgYQwvWF0RCBalLmgPcaK3OByw8upGbPKqgDT9QP2Ur79F5rcofuECSLpI49t8
	CEOFJGqA1Rb8czNs0X7iuAtvgX9CfvycU5KXB/HMpKi6r9aq5T3xrNi+Nd6NdL+PxtrWgLGBVN4VR
	fHWrVwS+7U96c7fCZ6ScSxIpjJMWNpf+6dN627xN4BEHA1KSE38n4choBwc79j1rb1M5XMq2BPHcT
	2zil9h4R8+DcGBtVf+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAGN-00000009S2p-0Phe;
	Wed, 25 Nov 2026 10:30:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAGL-00000009S29-0KX3
	for ath10k@lists.infradead.org;
	Wed, 25 Nov 2026 10:30:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTj24034177
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 10:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=; b=hS/j3m3NMdqSZNmn
	H/9F7AGBxeactUtknaWoOn92yBBi0bRfu+zo2N02aqxQRGFtbrErVNK7sFs2mV4+
	2oFBBTsKdaIVXaP+W8rYALcSTxg3wt+8+8gkcjFY43TFPhMS/k90svZG0YMOUTs+
	hv63zRTnzGFYKrM5z/EqI4jXPPvZyRTgpovS958JcOWnMBL9I+zXaomNrZX/DgMi
	VqBTIi8ctPeWKMEHRlP51MgTW1eeCh+O/4rQVfRtkCug/gwOc5N7axw+p02AgJ2s
	S6OfBzov599DVY55CVtxXrX9D+CP0yGmgsLz7nJotvFEFPfDsLqCgHCMOheK4BLB
	/Ie4jg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj9qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 10:30:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so858566085a.0
        for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 02:30:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602603; cv=none;
        d=google.com; s=arc-20260327;
        b=feqcR165BUIPUw+25Gke7igu2gA8QA4khuGUEKR6C+yd5dtm6/QGXv1pLV4uYMZasJ
         RejOzioi4+bmhUEwoWXs5fjqUj4UgOjCS2jz/mAMxytdnlpzC6MN7VbY7qdPvYz46v9o
         6VICHFQ3VINiCLzrVajbAIVm4sUeJRU2SHpPUmjBQ6m++i7vut5fRZQuv0/mkG/tPelz
         y+8W1La6svmLgJyrLjRddFjw4hJ1rkd77jVBznwuzcVjpHqvBDShgJVxUEST0cvcPdSC
         WAWiFPTtCmqZzVw3C8bLB7kZRDgFkXEESLVpzjaLNt3+d9ohqHRZvupdDrsnr+Xy7HRg
         gQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        fh=HYbiUOC51AOKscHnQxtZ0uwdAoP8b6PzC36NgayjV4A=;
        b=jKiRCnhlz2WXZIUnByHQ5JJuCwmK5DcYNGDdOYbi6gST0z5O3Js3L4jcyJ7kamyK8r
         dowQvHZdDT9x3qJkZb0d79bWlxYLetRHmT+c/gOCm8KwLHe6F9rRF/FLI0PThd+MSUYD
         Rh6fV5BwQPWKemm7led3RTKDxOVt9mWeRn4io5KzU/+6dpzsEGSVN552qM8ggg3pI/Tz
         oSSo1yz7+W/h2Qjv9fZlDXrcZZCyst7/qYc9MxF8BJQg0DvPE/cdaXhPU0ZuVz9F31Nv
         VTvklQjJx/hJNbAKswe4HDy5f5x0cmLavf8PxbEUq4hnlRne7RY9X3jTXnX2yA7ykB2p
         vdSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602603; x=1796207403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        b=NXXsvC63Xy3OIZ5KnMr7rFtDGl0JulG3U20YfU7+FLzK2gxoxUnPfdAspBSRxLhe+Q
         RTtecE98W4e1/4MkDRHefvd4o1TNhwS12958bBm8NNnJMqZslFF9OY7PzgiFdUVA8HVW
         C0LK5zsh6Hg+zMU6gXKyjwkj+i1uJTIbhCHVl26ZIGXkfPInIifjwj32iU3MUrHS1bCJ
         U6l3Iv8vVuutdJ9I8L/ynVqTUhv5iKRuLjeAojWpAV4vba6QgtjwppzWJ6Lz6RSdEg3r
         a2+wwVnE5g/SEKEHPpqA8l6YAi1BcZvQPNlxOfrCc1Du4pxx4/RQmO0S3s6IYHM+1JaJ
         4GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602603; x=1796207403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        b=dDPgJkQ7fvc7/skKkOK+J1WwqO36Gg510VLdvPkQYvTKgWDCFZr2km9N9FEb1rOh1G
         IaVPWqzlZk+litFmn7rXW8Vq2XToiXwscvTHcppTiiT/T5EKQBiadaH8eA/vPMlCazQv
         u3k0Dpe+UvmyHWfwJgMO5A7VaZDol401SnFAxFxLAjZpYF/4UVyeWA78n8sH2GF56Tj8
         txRz/8uXqk35HrOrKqjqeTidDW/Cb0RZch0c639qCVUzsmaFzYAn/SGTl+YF6MYcUZVq
         SS4FM585bqDxgW0/oDPF7np9hteTVoZTBD5FXHUEOj+VxbPIVmmYrVxjw2VjE+9xhZ4A
         6VYw==
X-Forwarded-Encrypted: i=1; AL+hErHUmEzfJSF5FOHuTs+xZVAZDeEG+Qj1gHGls/52gj4ODn8BXvo5Nywybfsk3MRO+hqyRrud5Ng=@lists.infradead.org
X-Gm-Message-State: APuU4Z9caBlICodeUxuDxXQyc2vAkTsiBt4kKZBJRNIEd5MKsvSZTVXA
	8Ol1YZxWU05PhtrTmBHifrFN67gjxDWK13PEb5wY81Efg84zi8xLTQAZfEkGv4bb2fzspEYMPo+
	SE7CJBFeKyVRV4oN+JCgjT9+TsrnXMt9VAb1gEamU1JOUesHdK/XijmxGyQlG2Q7KbL7SiNYjbV
	77/ejYDhkF9VMxuyUjiI5MsCTk1nw6fo3iuLNZl21PIJskjiUcT6vs
X-Gm-Gg: AZFdTZep9zns98UxB+KAa8zCCX/Ap/Y5QyrEknh45VF+zXjRXMcf3DfBHpby13qbPpo
	UUgorCCn6WfYwZ4oWKcWpYHXHq6YlzddZ0GtdT6YI2r9uHKSgAvjBQNYG1MAmGbt5jUbnEZiBXN
	gawQzad0Fo5vWnzj4jHbS1lyJxC+EkRcoz72tlyRlcfsfiyVqqma7N+wBTOzUqv5atuyfxbBYYA
	gRhD9vKDdlQxflHHahPNrqBR0JGHauQiieM+6Xn7mkUt+N2dpIj8b6wHuGFDsX4E3+dJ2gb+Vo=
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr2961757785a.52.1795602603559;
        Wed, 25 Nov 2026 02:30:03 -0800 (PST)
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id
 af79cd13be357-949ba9dade9mr2961753785a.52.1795602602972; Wed, 25 Nov 2026
 02:30:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:29:50 +0100
X-Gm-Features: Aa3M54pGufnYI-QRJO7Cvakq8nMpzAuX6uVfz_ev6QiRakiuPxsV2Dp10hW8EKw
Message-ID: <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 03/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXwWlB6h2mJ04q
 HbnPnJGHF2SmS8Y03drvLGLIXKdkx+1Oy+5lbBimln6mLBRMLWS9T/pTbjEO0moS260/grFLLoz
 ymMcBhzk1GuI/hWkmjUZ+6fdqFCRDV0=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b8ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=a4m5kgtdxY4tjFFkCegA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX+MukeE9WlwaQ
 vTMnCwBtFBzGU+4jW4ehRfDYQpd/yHt7Hs2Yu558Y8RbDUUhXsF9IU/kTX0xAj6FJL0bUElNzpj
 ihCnO5IlJ2fgI661KuU1sJNjtNjAvz1vavFGEXDv+nusCSvtI32bMgvj55U+EH1C0kawO3MWwVS
 1WJLwfaQVpiCBJq2YlVU5ZHgW1/pZNvGD68jiNDqnvDEgZL0b7EJukzC5pkibenrprmxECy9S5N
 GemEV7A/k3UPnYTqNd9z5T9KFDBPW9Hw9mGiflo+YJtCM+j+9MkFsvF5jE9wx8rFCVpRpocVFmr
 QAoz6g+ZQbWUnch777ZDkaQe2VlaEysgvfI9gHbtO60IxcyXYTMllm+XpvjbPtN7/TUTqeCwfX7
 jRSEDEDnp1BQaL5OBl5zDkUrztH9rNbo5igaH/1coq8ckCvf1BXsUS2u4zgVUhBkShyHXpaR5h2
 AQZ+QiB/AOkq0gpySfw==
X-Proofpoint-ORIG-GUID: z2bMheMItNiYpJCN4uDH7S7rLHaC_T43
X-Proofpoint-GUID: z2bMheMItNiYpJCN4uDH7S7rLHaC_T43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_023005_131802_60359609 
X-CRM114-Status: GOOD (  25.25  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 9:42=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
> hardware is unreliable") added a fail-count based transition
> to ATH10K_STATE_WEDGED after repeated recovery failures.
>
> When recovery starts, ath10k_core_restart() sets
> ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
> the time the failure is detected. However, additional waits
> may be created later while the recovery attempt is still in
> progress.
>
> If recovery ultimately fails and the device transitions to
> ATH10K_STATE_WEDGED, those later waiters continue sleeping
> until their individual timeouts expire even though no further
> progress is possible.
>
> On suspend/resume, these extra wait timeouts consume watchdog
> budget. Crash logs show cases where one or two such timeouts
> are enough to cause the suspend watchdog to fire before the
> driver finishes shutting down.
>
> Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
> handling when entering ATH10K_STATE_WEDGED so blocked callers
> fail immediately once the driver gives up.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unre=
liable")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----=
------
>  1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index b536c21630b1..3bb4d2742c30 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2533,6 +2533,32 @@ static int ath10k_init_hw_params(struct ath10k *ar=
)
>         return 0;
>  }
>
> +static void ath10k_core_wake_all_waiters(struct ath10k *ar)
> +{
> +       complete(&ar->scan.started);
> +       complete(&ar->scan.completed);
> +       complete(&ar->scan.on_channel);
> +       complete(&ar->offchan_tx_completed);
> +       complete(&ar->install_key_done);
> +       complete(&ar->vdev_setup_done);
> +       complete(&ar->vdev_delete_done);
> +       complete(&ar->thermal.wmi_sync);
> +       complete(&ar->bss_survey_done);
> +       wake_up(&ar->htt.empty_tx_wq);
> +       wake_up(&ar->wmi.tx_credits_wq);
> +       wake_up(&ar->peer_mapping_wq);
> +}
> +
> +static void ath10k_core_enter_wedged(struct ath10k *ar)
> +{
> +       ar->state =3D ATH10K_STATE_WEDGED;
> +
> +       set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
> +
> +       ieee80211_stop_queues(ar->hw);
> +       ath10k_core_wake_all_waiters(ar);
> +}
> +
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
>         struct ath10k *ar =3D container_of(work, struct ath10k,
> @@ -2551,7 +2577,7 @@ static void ath10k_core_recovery_check_work(struct =
work_struct *work)
>
>         ath10k_err(ar, "recovery did not complete in %u ms, will shutdown=
 driver!\n",
>                    jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
> -       ar->state =3D ATH10K_STATE_WEDGED;
> +       ath10k_core_enter_wedged(ar);
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
> @@ -2618,18 +2644,7 @@ static void ath10k_core_restart(struct work_struct=
 *work)
>
>         ieee80211_stop_queues(ar->hw);
>         ath10k_drain_tx(ar);
> -       complete(&ar->scan.started);
> -       complete(&ar->scan.completed);
> -       complete(&ar->scan.on_channel);
> -       complete(&ar->offchan_tx_completed);
> -       complete(&ar->install_key_done);
> -       complete(&ar->vdev_setup_done);
> -       complete(&ar->vdev_delete_done);
> -       complete(&ar->thermal.wmi_sync);
> -       complete(&ar->bss_survey_done);
> -       wake_up(&ar->htt.empty_tx_wq);
> -       wake_up(&ar->wmi.tx_credits_wq);
> -       wake_up(&ar->peer_mapping_wq);
> +       ath10k_core_wake_all_waiters(ar);
>
>         /* TODO: We can have one instance of cancelling coverage_class_wo=
rk by
>          * moving it to ath10k_halt(), so that both stop() and restart() =
would
> @@ -2664,7 +2679,7 @@ static void ath10k_core_restart(struct work_struct =
*work)
>                 /* hw restart might be requested from multiple places */
>                 break;
>         case ATH10K_STATE_RESTARTED:
> -               ar->state =3D ATH10K_STATE_WEDGED;
> +               ath10k_core_enter_wedged(ar);

ath10k_core_enter_wedged call ieee80211_stop_queues(), which is also
called earlier in this function, is it expected and harmless?

>                 fallthrough;
>         case ATH10K_STATE_WEDGED:
>                 ath10k_warn(ar, "device is wedged, will not restart\n");
>
> --
> 2.34.1
>

