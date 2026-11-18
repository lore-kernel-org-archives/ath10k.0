Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC1606A31C
	for <ath10k@archiver.kernel.org>; Wed, 18 Nov 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rGxKlk8e;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpY24obQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUdjSm/Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=; b=rGxKlk8e/657pU
	W/4UNGtXChd3TL9DikB7jDvItVnWHypcs5CfDtXQ2kzRWooc5BgerDtINxK7kaga+uCMnozlXNtqL
	J98Vna+gT0Wltpc5jz5rvxcCI62WP7DZPLx+atV74U36BWxYUDqJIfiMpn96Fzy5vAVK29W8NCkYl
	8v2kYno5x4QluU5bZwQINMcD7SJurQqNYNOsAX+wLy/Nyzi6S20uSqo6SUcV+JFuQt5pcVYba+LWv
	NX7KQDqatL32Uch+nwj+iDfmQ3wRWU4yoyw1AeQCKucjZPywadmXbdPRcF1nKcAEaHdwde3AJgsFq
	U6NT+mOBATDL3FSEQ9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbQa-00000008Ezb-1FYJ;
	Wed, 18 Nov 2026 08:54:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbQX-00000008Eyw-3Tbb
	for ath10k@lists.infradead.org;
	Wed, 18 Nov 2026 08:54:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8N2NE2106297
	for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 08:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=; b=KpY24obQq/1+/Jxl
	ErqTRoLkxNX6/ACBygckixxTMptbDZpaP4p7BxVTwBl8XNfq0i33iIUpDCfhqLjd
	7O9Fmc/rvXN8BVKSyFE/lQS89yhCIUfLFv9GXPljM+sNN0hj92U4DNmoRvXpSKxb
	PBRRC5FK0rZwKv1BJ/R3oDqQRNOPQfgz2OWe3UVQSNcv8ogGUZ2ogu6dlp8scUgf
	OLWRABD02vCfr9kExjaQYbb9BaBusmnwrdJolVwtVpjsfh/SyR0Bl7IYLno77vV/
	ULB1tFZKbNBlWoW2uaOk4/7LbPVEniqSZIr1Ti8QQvBmUltwLgxTkzrdIMdhqxZ4
	1eJntQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8t3y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 08:54:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so183547085a.2
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 00:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794992040; cv=none;
        d=google.com; s=arc-20260327;
        b=HKm7K2VlfGQVN3wuioFC8aYb8OmnuvycEN/yQQHDDEibsrymLrwUIaaOyMTBdODEky
         IZ/Mr/OkmeT1DrNz0AqBuztyYCvOSyPjjkmD1mi8WKYHyitKyfv3trK3RZWJF7dUXxOU
         IJSgHoLorpMQwNC2ck0GoON/NMgRVwfMe4yIkC1F1l/T70JRRgFVQYUEfoaGs20QNmI/
         NCbLBAetgzo5f/D9zA46aFRIjKQg7wd2JsxVOg8ndg8XrhCPoxk4rMDSqEzZTcQxUEda
         veFRlMju2+z53nmf95b1CI/Q1DvE5biO9fw/iEySoZFtK7mc87zuUnPvVBhDzx8oyK1+
         JiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        fh=We/lvz18ibMTZkboknSvzSlggVW3xKumovFtMEpXaZE=;
        b=EbhNFJyo7YDa5G+DCNLo/nDQ6h+SFooT2jhXMq83VrXIojYyLNtGFNbgZ8m60H9rIp
         9BRDKkpFpFX5t5burl4r73NXcCDBD0AGh3+LybTKA7CvuW/dRRC00QJ2AH2A8Wv58YMe
         3yFucIPUiGuzsHnBv1ZJWrSEk2PhjYWNQJwKMKFNz1DsB/BLM0V4J2hc1gu2zOjfba6G
         nh3qZM9XzMDFqC7X6IKGDfXrVxej7NkaGxBJY9whNG/5JHZusr0x+NmHEGpA/kjyzkU5
         +X9UxDIbOEf20ujHQB/jPoMoqJGhHy+wRW/bQVxG2dVqc1oTSCIENdYWJoP/DxRz6XwC
         NBWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992040; x=1795596840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        b=BUdjSm/ZVzJdNHDHYrij2Ri1c8P2xATR77XdXCj3vqvV7lXZDlKKGNhD5NetngqI0w
         W4i209pZQ7X6Cr8x5JYPGcB3+wgGhse9My8AwHwmBo6wdd2LrHlZEKTKWz8Fy8M8VVUM
         e3g+5CAYufxhNKqmktsGE0Jc5KRypTTW56S7/VDcKAgvwENCFGYKLpmEfx8xNyxmaXDj
         IDh1c/lVG2Fb1nsHq7BeCf0UPp3NVzTJquuc8R9QlzKoFA/izI33XYFz/rGdo/OnG1rN
         kmIKMz6esT3hQLVPUStOo9TqZZq2ErjAIsVtmQAZq1oTcppK+vX0cUaXkS/1Ki6Di47g
         t/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992040; x=1795596840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        b=Y059zHa5/kkew/Lgk/WZ6dos4e41qT/YbXFY+Ow1XquOWpkEZ6BMWEizdhcoKN75bm
         YsQx/ygAsG898u1nfHtveHqNUnYRMhKM0+pydT8E69YC7mstGv9T3aGsw6BE3cioWKhq
         aMSPNFRVgcnKc3vzBWja2QCQ0tPt8G3iHRqzcfbTOv4QkqrzoAY8ubqah0dm485v3X6J
         bYXw+QV8oE3EY6G4WTxjTZWzast9WMRrfuxH5SUFK1BnDjWVnLFmkI7xRuroU5Sn2nKa
         PYM9CbT3lkQCcsFEarZwTLsJQ9xK1fyxy1rBxxoWmHhYm+q72rjSmFL23VDvL1ugCjCF
         mDew==
X-Forwarded-Encrypted: i=1; AL+hErHl5QSJrs2pK3wthWWY48sGhUqD45xdrBuO4aQZawCc33lFsdoxHf/sHPSdnjyEeFr/03xBgSY=@lists.infradead.org
X-Gm-Message-State: APuU4Z9TpBpMYD8CM2kMsUjAjchpH23dycL6uFB4C9ih0xyaY4rkwp+e
	efDRMKoYd3CoMKXCuqVWVoq8TRUATnq4LrAizqftKghKdCvwIrPIUuwGuT9+uPnIUbj3pMF7Gsn
	R1oFeNrVs1edp9n8muk587pu1ZKGP1cu20Ug+SVFeAJOIfjlXyxLfiX1EZkax20PzDvCFgp9FQh
	VgeY5EtOtUmnXegB5YpG66dQqiUiZcIMIb2pDZmp4=
X-Gm-Gg: AYBFou2n4op/jUfl16vCrUeUQfTmQgpWTxpLOMjDku67UeQGlOfTg+iNUcsaxdh7WN0
	S9bKB6w1H368t0FvRf25kg3cymZpSA7vPlI/TFrhps6WAXQnX8LqUsUf7XdqIUvsvMio65KlJ0i
	YNjanAamGbTN+ALnCSdzEb8m3lSxxqK3r5GJyGflmaE+ANBCq+wIaRWxPpKAPLeCwbMraaFtfpU
	JizVDOtiChemeBVXCZ9ndnI0UGtIRjYgVrF3lqfz7gKoKTl1YvIw5j8NDjvzhxP4dtTu2VSvu/U
X-Received: by 2002:a05:620a:260b:b0:949:6574:f36a with SMTP id af79cd13be357-949995b3c61mr358672085a.38.1794992039982;
        Wed, 18 Nov 2026 00:53:59 -0800 (PST)
X-Received: by 2002:a05:620a:260b:b0:949:6574:f36a with SMTP id
 af79cd13be357-949995b3c61mr358669885a.38.1794992039459; Wed, 18 Nov 2026
 00:53:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com>
In-Reply-To: <20261118052116.3901761-1-lcy8047@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:53:48 +0100
X-Gm-Features: AclHuK8sONdAXHDBXSHnReUAAHAsZCMvEJNaHxHQtWOAW5ELRw1-8RjKZhSzGYQ
Message-ID: <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Changyul Lee <lcy8047@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -V_7iFjRbfDfEFxDUBtif99DD3Vz_WKA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX/Oca4J3S1QnM
 /E4UsrgmfmHI9CS0RyoU1IlFU4GQu8tZonx+OhIFDi/87p0D2NAtXP29R5MDLeDPTDM2Gl1V+FK
 Tdhz5ecigOXQDS/7r5ylI9QQU3TNQBE=
X-Proofpoint-GUID: -V_7iFjRbfDfEFxDUBtif99DD3Vz_WKA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfXxT3YzB7HLIs5
 xuR35U97G5cnx1fxa7z/9PYKF/o7SdDCd9DxFsLOX0WOD9VEEOvJPeZ7T0nHUpp5TlbaAvN2Tje
 zd0m2qDZw3MAnuEu2QzvG5Ea2qQ7TxSeXg3AxWutia03hQqVDPgObYZ3MXS3AFzTfesGCuDKWb1
 g+nxGlF9dS4eO9vz4hJB/ib4UDACMGWcrn3cIl33IZ/KwKc2BDzoa+am2YJRRUtUmvpJv9oNZG7
 W1MNEVddarkZbGwtMBPnOPz/+AEdU9+ZmWWTAzEy5wHFBJjuNq5SX1hI+1XZFd1dZNBaD48Xovw
 9Bs27HEBxppgVLm+yZmDDFGk3bAMpWWo7YTa/4gbR65/9Kmw+ZqsyWY6v/+/Nrw9lKgzkSKlv4M
 RkHLlIsWnufjfY6p73l0TkzPy3KCtgXdbQDhMuJjnPOI9UZ84PcUPwX5xWPdYqrRj/ezfP5U1ev
 scJvV5dyFpK42yQIu+Q==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd67a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=lJo5bTS-0ZoCzmS7HdAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005401_987021_D9A5D45A 
X-CRM114-Status: GOOD (  20.75  )
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

On Wed, Nov 18, 2026 at 6:21=E2=80=AFAM Changyul Lee <lcy8047@gmail.com> wr=
ote:
>
> For SDIO and USB devices, ath10k_htt_tx_hl() allocates an msdu_id in
> htt->pending_tx and takes an extra skb reference that
> ath10k_htt_htc_tx_complete() normally drops. If ath10k_htc_send_hl()
> fails, for example because the endpoint has no TX credits and TX
> bundling is off, no completion runs and both are leaked. After
> max_num_pending_tx such failures, msdu_id allocation fails and no more
> data frames can be sent.

The above message looks too verbose and confusing for a somewhat
simple issue. Maybe this should be split properly in two fixes.

> Free the msdu_id under tx_lock, as ath10k_htt_tx_32() does on its error
> path, and drop the extra skb reference.
>
> Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
> Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")

If this is a fix you should not target 'ath-next'.
Two fixes tag looks weird, what are you fixin exactly?


> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
>
> Compile-tested only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB
> and W=3D1.
>
>  drivers/net/wireless/ath/ath10k/htt_tx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wirel=
ess/ath/ath10k/htt_tx.c
> index efaea150025b..b437b09717e1 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
> @@ -1378,6 +1378,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt=
, enum ath10k_hw_txrx_mode txm
>         tx_desc->peerid =3D __cpu_to_le32(HTT_INVALID_PEERID);
>
>         res =3D ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
> +       if (res) {
> +               if (ar->bus_param.hl_msdu_ids) {
> +                       spin_lock_bh(&htt->tx_lock);
> +                       ath10k_htt_tx_free_msdu_id(htt, msdu_id);
> +                       spin_unlock_bh(&htt->tx_lock);
> +               }
> +               dev_kfree_skb_any(msdu);
> +       }
>
>  out:
>         return res;
>
> base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
> --
> 2.43.0
>

