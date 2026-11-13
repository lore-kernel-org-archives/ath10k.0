Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843C606A32E
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a9O9A5jq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OwN1/M4Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yzm3Wb50
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=; b=a9O9A5jq66IDKg
	dpmYygKeBQMzJRM0C5NvzpjuI6ly2Y+mclUX5/3wEU0A345pOwrAbsGQs0vhslHXNuu5QWBHxk9vr
	ghYnHyTBVp3HuNt2mbkT3nFOVDN+oLiPttmsWX3FPFZPVLiLLuqXVi35yPbUc//vCWLO99SOJNOnz
	088P4ffN5sYP1D0KDP/MYL35yMPnpfAbpr+RtzFefY+aqDDchsT2GKWHJ508LqE74XtrsUqz7eAun
	M4Aq5VHUgyx2aRx+UI9jSpVIsf+cvmeC75Cvr4sdYwk0sZvHUtXUhcUe60K3nkcFlrAgSGyL3vLoD
	IkLu6kVcHR3xobuy4c1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnmB-0000000CFEv-3aiu;
	Fri, 13 Nov 2026 09:40:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnm8-0000000CFDn-4ASO
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 09:40:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uvci3164531
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 09:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=; b=OwN1/M4YDae6Mh1n
	t1kPuMJtk04rEe8lVDx9PYrDxOmtFrGCAyq9h6ciAoc6jsMAhX8v/BemYK2Yhtla
	qK0jwA/TsfdyVLCdEP3NmHGc39YwsNmRGLqL5QQEoL8qwwbsOD07viyDs9GiNKwz
	LriFTHwoZNG2noQF55hnFAiReTka+/Bse4EBSXW24FfOkYWyofUm5bX73BEVlGeF
	gtUawsT40238X3FNzuk/g086zRXERkYvWDESKxcZywQCdGI0Y51RuObfHXUyZSDZ
	xYQ8AATMAlTry8el9nNg6spo2mzblvxf+mdLvAdt6L+kxNl1dWjDPEsbVpwYXtBd
	mc7EKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2ms5m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 09:40:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91f0f4c70cdso1705806d6.3
        for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 01:40:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794562851; cv=none;
        d=google.com; s=arc-20260327;
        b=NQHcmdK62z7Vg8qm/DhY/wOdgWhSNJJyPICqj1lGSwmj4sCc9P8yjkBwIyfQaqvVhm
         oSgIijT2qAS2qmrDWRkQEpYN8R+PJHMg4nxcvXCGRQd+n0m+vlWsXFTukguyVcKoo1UC
         WXMF5wsvU6gR0wOtFLfihoMnAPJBvSAq1Zkc1uSMsWp01LRyyxMKpXAYvYLDUmM27qOU
         gauF65Cp/hoXq0AyMRYmIUxG0uHdQKhQwBgTkzFz53YqHJ8sjbBL9lyF1+jylin2Cgde
         9+vWvYiBoxIw9XNQtdEJ1VXJg5gvojFipvOUoXBdSFx6nsGc6pgFKfHu7S5V4zynmLvm
         V8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        fh=H7qVbHRWplcZ5q6wLPZXDw0UiN+QzaoEcwSp44BcIgc=;
        b=JNF5gmNY91OBRD+NUkyhpCiI5ojQMfW7ycBD8Uxhu3m4hgmuajDQLbVO9+XODJuwUY
         ADbnzYHE6BLxXPLGmbh+d9rckVKEkKNReSDl2rjq+3Dw0TVE1SCR9A9Y3bEpjZUhmqEZ
         /76aKdTSfGNjlzrhFSpMM7KvuFyU31MqXFagA59HZBX8feTsdK5e8xqxi+mfgdgjJGtW
         YGEKINv6BJOE9ABmCo9cShFdD/90BpLWXZvR2vQ2AJxUzm7/FyLPMHR3W0cOLwoE7RDP
         eo4Upo+GDLb/qPYJ2k9/ve13hLXelM0mX24DAKwQo+9XSatH0uxdGSTYekv6fWl3HPPk
         jixQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562851; x=1795167651; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        b=Yzm3Wb509s6GmpGVNZfgpfoOpDcKuF3M9Hupgnc+JxmLXs4mqBU6foGPZHM5QWuGMe
         z7mvEDmrD4S+6Tp2yzyaIX02Vy+mFtKhiqLgu2RDnUvDdEW2j66W3ELWccldHNv4ebR2
         Rgbh4jCQc58q9AiEV9yLQBAKShCeuqUvRBFKIAinbtpK1rJ6cUypvLOOwKY/HZHmcsMl
         rp7u573h8rADEVngK1AdyxqXj4Q29yucN8imlbQi/oeBxaiY8N9YYf1IxsR1fV/oi/EI
         3fEYA5VmeBZS81+mK0EX2Cx9cJWIgg/bS2ExhJKvA075Zkt9I4IMH7mT7qG2ftglsP2l
         20Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562851; x=1795167651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        b=o9xvKk4dmF9yaCuceKNqCQWYqzsgX6s99SnjFREeekqX2raBWux0+dNir6ig+s6UZU
         nrNS+ZuEL5HAxWCjkm822TgTfLbHWVJm9VGI45cGbjdgzziH3t0WqihBXmnXwVgWs1F4
         Hhi0c1xyCwmN/pVuR+MfGTg5zf3Qoz75V8EVT9CT6dc86OOqB8AgIFUd4g2Gp9dNboAX
         x/rVOtYJeij9pfIgyoLRq4XCvBQZKIDZn6R4xYyFCJJQu6zHIuQO2JZXZwYbUPdTkHWL
         dLyXmNq12g1m/oJFPsrHuLZhnQkRoe12DFmNqKUp+nnNqWZL84ilL6Bka1NlTfiTKFyr
         uu9A==
X-Forwarded-Encrypted: i=1; AL+hErGIZV8CndfdOoL2UTX2lVscLVY7+k/MkPQO1drvUm8Yh61Iq7ouMKsSL4lhBNStdVfF/GzxJDc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9MO9ZSpFRF8bneNV7l5fY1KPPkdZbJQ6X79zT9ungQma6dWcmu
	lXyqPKTZVhv7i77w9C5BRzxA4xI/7FD6jT1GGijH2gx5r3Fcg5gJjBqPJAaYDcjpqtqD8kHscS5
	ghqRzqet/h/l2pvB6rNttXhjYDtpDPHQAsxi7PXYBeFH529iScGdPWyItzpV5gH96hgSmN1zaJA
	JcV1rbHO85Wg1pwAfqVz2D3ohBHY+Ip9yBjUMxGfU=
X-Gm-Gg: AYBFou1+kiqZL+0F+s1V4gJbFyFtHGS5cUbAU5y8UopY8N0VclG2CSwh1DZ47g7151s
	GihkU8g4Mxv5X96RxB3rBURpgqE/hli6fRhLVNk/ixj6mqao/mQj5t4HLmSTNrLc8OUrayow0JA
	TuIFDB5V7l5s3MmXKzoD1ne02O6bggM+aPdQCfS02Ynvzl5WFok1SbIaAjYoBXuseSH6aDKDgc/
	M6m1l+100d0/g4YOWTq8g2bCK+Yv0voovi7bWUSjfKCSxHg2Njf6S1Xo+KWcwrlbV8z4WGcGggU
X-Received: by 2002:a05:620a:2616:b0:93e:c6ff:b787 with SMTP id af79cd13be357-9494baf6061mr306640885a.13.1794562851355;
        Fri, 13 Nov 2026 01:40:51 -0800 (PST)
X-Received: by 2002:a05:620a:2616:b0:93e:c6ff:b787 with SMTP id
 af79cd13be357-9494baf6061mr306639085a.13.1794562850904; Fri, 13 Nov 2026
 01:40:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
In-Reply-To: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:40:39 +0100
X-Gm-Features: AclHuK_8b8bwFHBBv8-vor330OglvaejRUeIF8CJZhplHPOL4obTXFv6PeqHxyE
Message-ID: <CAFEp6-3EjRbdx5JuC9Xt+j5eY7R+CG-iFerDDB2n2kSzk55LuA@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: fix status of bundled mgmt tx completions
To: shunsuke@nagashi.ma
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 182XwQ16Lcb2nBKUZUcVWZpYo9NYzRxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfXxY2+wLhyMvyW
 YH7a0Ujc0+lXZRgN9i2P/PsKO7uvoWy82yBY28c/Rl2Nm9U524N9lZOzLOpNNMtllrEGEbkrQdH
 clNDGbKztK46ZucS80HmmxhdQ3Mg2AnjbnS37ilQjG3KdBPXulmDhQpXiGLUKocVI9WTS1mwvXc
 FXLgjF6vZLxLqk0zlGNJg/pumzN+2EP+PNYWETcuySNBdJvMfsUNhQT9f2WpaFMTusqpUbUClfi
 ZYaHcOYr80NiYK6XoeNoqcrnstjQ4ZKHBq1Dm6KqO682XzaebPIiC8wEhKo8eyieqAjcJ/ShcNF
 pcFoL01OWVkfTsyhn0Ad7XYn3mMPQWdCzqUUWUv36t2f0KJNs9hrmrX8KJg2gAeonmsjqhC/Ds9
 EtdmAOma4QwqAPtwauuN+mpuDHbWp8zUChC5wGdgmqjipjgfqOSRIsIRhMS6TBLAB2Ts12/att2
 hurhD2okZb31gkgBIvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX8AOPIKQ6tft6
 joBNefHQvT5wo0dEqW3tkUMlg0rke4WSR6bZRGfQJpXWsRcmYK3NnWb7+hfbBNE/Qzi9z36B/DT
 zMe5K2qX7es/w1n+YK2vjSgvn3bgIRA=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6db24 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RNmw_1-gx_wr1L6n6KYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 182XwQ16Lcb2nBKUZUcVWZpYo9NYzRxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_014053_040894_D9131811 
X-CRM114-Status: GOOD (  34.46  )
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

On Sun, Sep 27, 2026 at 2:10=E2=80=AFPM Shunsuke Nagashima via B4 Relay
<devnull+shunsuke.nagashi.ma@kernel.org> wrote:
>
> From: Shunsuke Nagashima <shunsuke@nagashi.ma>
>
> ath10k_wmi_event_mgmt_tx_bundle_compl() takes the completion status of
> each report from desc_ids[i] instead of status[i]. Any non-zero status
> is handled as "not acked", so a bundled report is marked as acked if
> and only if its descriptor id is 0, whatever status the firmware
> returned.
>
> The bundle handler read status[i] when it was added in
> commit cc123fac978f ("ath10k: Handle bundled tx completion for
> management frames"). The commit named in the Fixes tag replaced it
> with desc_ids[i].
>
> Seen on WCN3990 in station mode with a WPA3-SAE AP. This firmware
> advertises mgmt-tx-by-reference and completes some management frames
> in bundles. A debug build printed status[] for each bundled report and
> could switch between the old and the fixed line. A sniffer watched the
> AP channel. The firmware status[] matched the capture in all 39
> bundled reports (15 with the old line, 24 with the fixed one): the 30
> frames with status[] 1 were never seen on that channel, and the 9
> frames with status[] 0 were acked.
>
> With the old line, 6 of the 15 reports gave mac80211 the wrong ack
> result:
>
>  - 4 frames that were never seen on the air were reported as acked.
>    Each report arrived after mac80211 had already timed out the
>    authentication, so they had no visible effect in these runs.
>  - 2 SAE commit frames that were acked on the air were reported as not
>    acked. They were the second and third of three tries. mac80211 gave
>    up on the authentication 239 us after the last report, although the
>    AP's SAE replies came about 5 to 8 ms later, so that connection
>    attempt failed.
>
> Take the status from status[i].
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c10-00459-QCAHLSWMTPLZ-1
>
> Fixes: 4b816f170b1f ("ath10k: add support for ack rssi value of managemen=
t tx packets")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse
> Signed-off-by: Shunsuke Nagashima <shunsuke@nagashi.ma>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Tested on a comma four (WCN3990) with a v7.2-based kernel
> (7.2.0-vamos-7626c37). It also carries three out-of-tree ath10k
> patches (MAC address, in-order rx A-MSDU, SET_KEY wait); none of
> them touch wmi.c or wmi-tlv.c.
>
> - Debug build that prints status[] per bundled report and can switch
>   between the old and the fixed line, with a sniffer on the AP
>   channel: 6 connect/reconnect runs (5 WPA3-SAE, 1 WPA2-PSK),
>   39 bundled reports.
> - Build with only this patch: 6 connect/reconnect runs (5 WPA3-SAE,
>   1 WPA2-PSK), no debug output. No warnings, no firmware crashes.
>   One first connect failed and one reconnect was slow, for a
>   different reason that was also seen with the old line: the AP did
>   not ack, and the firmware held back some Auth frames.
>
> Not tested: status 2 or 3 inside a bundle (only 0 and 1 were seen),
> AP mode, other chips and firmware versions.
>
> I worked on this with Claude (claude-opus-5-5) and Codex
> (gpt-6-astra). They helped go through the logs and sniffer captures,
> write the debug build, and write the English of this changelog. I ran
> the tests on the device and reviewed the change myself.
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19..67be6e817 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2512,7 +2512,7 @@ int ath10k_wmi_event_mgmt_tx_bundle_compl(struct at=
h10k *ar, struct sk_buff *skb
>         for (i =3D 0; i < num_reports; i++) {
>                 memset(&param, 0, sizeof(struct mgmt_tx_compl_params));
>                 param.desc_id =3D __le32_to_cpu(arg.desc_ids[i]);
> -               param.status =3D __le32_to_cpu(arg.desc_ids[i]);
> +               param.status =3D __le32_to_cpu(arg.status[i]);
>
>                 if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_ma=
p))
>                         param.ack_rssi =3D __le32_to_cpu(arg.ack_rssi[i])=
;
>
> ---
> base-commit: 753baa59527f8e606c49eac25692b8b08918a3a9
> change-id: 20260927-ath10k-bundle-status-24113117b683
>
> Best regards,
> --
> Shunsuke Nagashima <shunsuke@nagashi.ma>
>
>
>

