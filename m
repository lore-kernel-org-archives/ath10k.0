Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF04CA5FF0
	for <ath10k@archiver.kernel.org>; Mon,  5 Oct 2026 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufaCf0U2AcnN/hqLilmYCSsvPuytCqyVtjw/wA/CUsw=; b=Cy+sZmgr84c4+pCBB9SnZuKwlE
	Lp5f0ZhbgxyWxTqUw9Y5zaVn6ysLuicDJJ3jfVSbPl6MDmFODrS6DxY+P3rNBOJU9yAdVufRWGtfZ
	eTC7jWdQYaq+Y+fbu9/geAENjjCm8EHWP30k8qPAx1/5UNgvZwbsSI/yXtR+QHdrI5AVsVnCBw80g
	BVaCMGu4Lb0U6qY8A2CX0FX9ygvgcB3NXG9KHD1PfOQAzZMOsjLdk+LyfKdY9595gEOBqVdnNHfwJ
	I8ZEKEcdMhs6RcOJOTkHndV3iela2S7Kr3Oet9qbwB3YxGajHDl4LnsSAybuB6XY4G1Mu94Km16uM
	iN2tfZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkKF-0000000GjUy-0NxZ;
	Mon, 05 Oct 2026 15:09:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkKC-0000000GjTw-3vbj
	for ath10k@lists.infradead.org;
	Mon, 05 Oct 2026 15:09:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP7Ic2214892
	for <ath10k@lists.infradead.org>; Mon, 5 Oct 2026 15:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufaCf0U2AcnN/hqLilmYCSsvPuytCqyVtjw/wA/CUsw=; b=AkpCwTj+wij4vo2h
	+jineqiZAyF5xU4j7prbDAmwfTt84sutibdVDJjeVAKNQSD3cD0jPtUr2D1sRa5h
	6RvPAlaSX3wBv9IP8aG4vrsq0NL8eRtfRVILiNt+Ao277uwmM5xO7DRgXRM5fmy4
	jNRnA36M1+QYuT915FxONO9/NjkODOPBD5bRx5Q8h7jL/s0Cj4+z577mw75OOC82
	NRtcAW/jA289nzzWPHuVcgGhB3ZMviywRKrSrbsrdpK3xzoWON7n4soQ7e1HwfO2
	afqnlJWhXRfwG2zTRtnbOrUKBxjeGgWQ+o89wfnUbUXhgxP5uMqsQ59tmq8muXL0
	2PpwDA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyts91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 05 Oct 2026 15:09:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc78c0402e7so1015872a12.0
        for <ath10k@lists.infradead.org>; Mon, 05 Oct 2026 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212996; x=1791817796; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufaCf0U2AcnN/hqLilmYCSsvPuytCqyVtjw/wA/CUsw=;
        b=TqSIZjELdy3rjsBgPcMpAKlKtkKIuQzLJibxVY6JKxme82u1IktlOOo8yzptTLntdi
         NZfyJrPUp7JavEXB/T7kU6iMn3TSO4zKOJIqpNCCc9k+G+zquZoz0H9iBfR8bV447S6Q
         mdhdlWP6y9EDf4azs3sOSPU9Dr8X9xfVMQwwIbY0sWeW/4CNFCgwUqoSuM4Kedt8GnO4
         zILfqRr0Ik4KVYbGr02QCrlzq3MwcB68OyV+VWYkvCmahJbvlvSDyhAxzL0dSAlbgzDP
         97dcD14DTOg+MRgd/NEiZm0j82XwGRStIkAVi2WlKavnXK5BMnT4T4N98ZknuUWdws3U
         b2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212996; x=1791817796;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufaCf0U2AcnN/hqLilmYCSsvPuytCqyVtjw/wA/CUsw=;
        b=nUb7CcSiOpcQIwYx9fLvvaXCCOVN8porZZn6kX98OCxT8e589aO8qcfPKS2D0tK8Mk
         vmNPxMTCEWnNQfxcWZUdG6piPsleWiUQWJrXLV+PQqNvf3JD3fd1TsP9q6pnRCR8FJYK
         7CouISVjADZUib73bftyUtudCRwXbghXR63CYmtPp+o3gX3TmOrLP+ivn496nNlK+RHk
         NxwSnYt0euhWEa+UtyhtQTyjQOYkSIx5ndx/TVC+dUuGj5tyPhgK2/UEBrISh6n/+lnZ
         vBYtgm7xiXJECi8hnetdoVroYokY83NjhsTuCin7DxjB/kfsnlvqX3SkXi6Vw96vTtsF
         AZUg==
X-Forwarded-Encrypted: i=1; AKwUvBxrUkH+YMQSqNIDfYbHQI1dtSJ83I3aXGUkivEyJAoDdXNNB6iBN29TRL6vUQ3YXc6O98lKT4s=@lists.infradead.org
X-Gm-Message-State: AFq9FYITcH7JDXxGm1GNSXXaHfZtMjlCpGLzHt9pbNjqe4vOopiRHAFe
	hPiYd9RernmojO99ExI+JUs7Fwo5FgOvsAbYXNOe+IxT94cPt3e9W8S4XzIiaJcUhrvIjRs+jGo
	KGH345WL5CMaq4eFLwtq+saRnsBFaDAPRsX3SFwgeXjQnc22bhEy55Gx8Taq/F6ne
X-Gm-Gg: AYBFou0hTf6K9joXA6niTT1cyQ6mdT13EEXNbVXhWFi0nk9CSPbMp4OOwexsVmlJYT7
	EJ2jog4Km3MY00BEEOhGHQ7WcMYH+c+0V97L0ucyyivCtedx/qxibP6MXRQCFKwvi1aXIq99ndz
	25uPz/j/pN29UDJTDqOipaoFp/YVYsn2TNhhIsHiSCRt6nHpXVwZnSmuk0b+MVlW9pAdl2z3lfS
	wVjNAoifkFoeRjjNhHz4hvVPy5SVe2T6K+J5iCXOzaPe6Pv/KW0tRZiKFDxLFeyBJbzWAc38hTQ
	6HjRpRV7xz4jC89cwEaQ/0dRnK4H6jkpGkJKPzBMBiDMf4xTTanaM1LupE+VvnvyKS0mw5fn5BZ
	NUp7RF5z39vLWFub16qTlg+E7xF7SVIM5LeXpV4vKegVrohMs5XYwbDA=
X-Received: by 2002:a17:90b:2d4c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3a6ce606ea0mr6489949a91.3.1791212995705;
        Mon, 05 Oct 2026 08:09:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3a6ce606ea0mr6489926a91.3.1791212995189;
        Mon, 05 Oct 2026 08:09:55 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1bfsm9130075ad.28.2026.10.05.08.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Govind Singh <govinds@codeaurora.org>,
        Brian Norris <briannorris@chromium.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Albert Esteve <aesteve@redhat.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
References: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
Subject: Re: [PATCH] ath10k: clear QMI if failed during init
Message-Id: <179121299276.2358654.4837860539167198110.b4-ty@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 08:09:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: vfrS2T6heiTmAzG9GKQ2qJxDFQlqBC30
X-Proofpoint-ORIG-GUID: vfrS2T6heiTmAzG9GKQ2qJxDFQlqBC30
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3bdc4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5T_40O9Wg91NOdeNfzkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX2ZnB4PsDmzg1
 NQjNCLO7l72rkGV1fFIi59NYG99KIrvfwf3MOHAI465rW5pnaNfTDFKhYAsHjYHQLTWoP2cBXaN
 8rGpVAaQJRnCLgYOPCe5aqMNgdfD+OtsUVxHTLGl783DIm5w3yWXJQhvOGoSQKX24e9shyOt1S2
 948Ax2SiKqOKd6cJA7lBPaxCU/9sDS9MBDmYpasQigOVWXwrsgO362J+m50qlYN+o601eQ7LoEu
 +/I7RgktUvQHIcZcA6bvEELaHm+U4tpUbicKvQr5H2ztjoFKr1IR473VqGgCB1a+FcqQxha9W44
 ZV6aC2OXwlh/a5sO4LQVXbxnwjUapUhMMLUAL0VA23NbdZ9Z62VVJZBgZBPu9zHsFIjJIbTHgYH
 L2XHkVmcA0UZU10gEe3i0kbMHenJvfCl7J23jBWrRnNtIh48JH11IPFfs4dmq2pMILBdqf9G48S
 Evby5jZvUK0YiuxiH+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX7zzCp4VGtNzg
 zC1TcRxfQWYy7DSOeivopY1Qxj3zxyLniwSqZyCi5hvBeTpr23SWQPm7SpQJs8OPP/aXpg6bEPp
 Cvw3y9xgPNOKGnY/IMELYTzxBAUGIW8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_080956_983960_4C7DD6F8 
X-CRM114-Status: UNSURE (   8.36  )
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


On Mon, 14 Sep 2026 15:05:19 +0200, Albert Esteve wrote:
> A failed ath10k_qmi_init() left a dangling
> pointer (ar_snoc->qmi) in the cleanup path.
> Clear the pointer on the way out for hygiene
> and consistency with deinit().
> 
> 

Applied, thanks!

[1/1] ath10k: clear QMI if failed during init
      commit: 129324b60343dec19d45dcf87736f129b18b95bb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


