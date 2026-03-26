Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D260D10AB807
	for <ath10k@archiver.kernel.org>; Thu, 26 Mar 2026 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sSZdOlH6LcaXmEulL+Z3vD5W8JNjS8vj1IOyQwqalY=; b=e+CjNS9Uj6kL9zeVGIA/eUdC3R
	k4KVThngmF7TIeWUpJXUXI47+yt9iujJ9yIfZp4PabyF3oca/aYXbI+Vsu/k6tjO7G/vl8/jGx/ir
	T3bsH2MG2jLnSYIoGCNG8SvET1AfDKGtGdql5s1bSxAnOj/IHLRX/AsMopkMz33LnjTGqGC/xEreb
	Rary8CcqiBTC5TlR4MSd6iKA//xBx+JCWxSAVqKgn8YVFLe5Tkcn9tka1YhP21dKwa6W7dCneH/F7
	o/GdsZysgkhgr41HkNziT98RmZjiyxXPZUN3WJF+lUWQQ/mIM76Lkh6yU7A+oyCTfYNiQqFTNwpzW
	rV58QQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qYp-000000067mu-0EiY;
	Thu, 26 Mar 2026 19:40:07 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qYl-000000067lg-1p2Y
	for ath10k@lists.infradead.org;
	Thu, 26 Mar 2026 19:40:05 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774553998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sSZdOlH6LcaXmEulL+Z3vD5W8JNjS8vj1IOyQwqalY=;
	b=XTH6vNZfTs+Rhn/5LbLqBySMN0ZX5pl6xsbTh9654tQcRAh1k+4nFg2w4G1u1qCntQiaZ8
	A/R2MUis4bsWUAwdlxAgvsKMoCQTVTKo5FYZ+UF5W86+DpeBTmUVbgxC4++ZpZuZrgdUd4
	CJEUl378fYQ+f+HtmI79PftGLkYVsggFhKDl/3JVteu3ZiYS8a22o8T7OP9KUtpDC4JYac
	9CXVos/p6+ikPQVwciRBc6BdRnFiAKhP5CmwYb+nAvENQrNDTM6rf7qlh3ECM895NMgvQF
	+ztY6H8YDr09klaAyYgCcmhSwrhKLlLhwgvTQs0BGGViqdjhMKM87IDTt2Ed8Q==
Date: Thu, 26 Mar 2026 19:39:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <425dcdb501ed6ebb0e652c58ef2c56c78754884b@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap
 QMI requests
To: david@ixit.cz, "Johannes Berg" <johannes@sipsolutions.net>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Jeff Johnson" <jjohnson@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: "Amit Pundir" <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, "David Heidelberg" <david@ixit.cz>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_124004_167962_A74E51C2 
X-CRM114-Status: GOOD (  18.99  )
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

March 25, 2026 at 5:57 PM, "David Heidelberg via B4 Relay" <devnull+david=
.ixit.cz@kernel.org mailto:devnull+david.ixit.cz@kernel.org?to=3D%22David=
%20Heidelberg%20via%20B4%20Relay%22%20%3Cdevnull%2Bdavid.ixit.cz%40kernel=
.org%3E > wrote:


>=20
>=20From: Amit Pundir <amit.pundir@linaro.org>
>=20
>=20Some firmware versions do not support the host capability QMI request=
.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.
>=20
>=20The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
>=20
>=20Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is no=
t
> fatal - Wi-Fi services still come up successfully if the request is sim=
ply
> skipped.
>=20
>=20Add a device-tree quirk to skip the host capability QMI request on de=
vices
> whose firmware does not support it.
>=20
>=20For example, firmware build
> "QC_IMAGE_VERSION_STRING=3DWLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
>=20
>=20Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c | 3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h | 1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)
>=20
>=20diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wire=
less/ath/ath10k/qmi.c
> index eebd78e7ff6bc..e7f90fd9e9b83 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -808,6 +808,7 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k=
_qmi *qmi)
>  static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  {
>  struct ath10k *ar =3D qmi->ar;
> + struct ath10k_snoc *ar_snoc =3D ath10k_snoc_priv(ar);
>  int ret;
>=20=20
>=20 ret =3D ath10k_qmi_ind_register_send_sync_msg(qmi);
> @@ -819,9 +820,15 @@ static void ath10k_qmi_event_server_arrive(struct =
ath10k_qmi *qmi)
>  return;
>  }
>=20=20
>=20- ret =3D ath10k_qmi_host_cap_send_sync(qmi);
> - if (ret)
> - return;
> + /*
> + * Skip the host capability request for the firmware versions which
> + * do not support this feature.
> + */
> + if (!test_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags))=
 {
> + ret =3D ath10k_qmi_host_cap_send_sync(qmi);
> + if (ret)
> + return;
> + }
>=20=20
>=20 ret =3D ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
>  if (ret)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wirel=
ess/ath/ath10k/snoc.c
> index f72f236fb9eb3..3106502275781 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1362,6 +1362,9 @@ static void ath10k_snoc_quirks_init(struct ath10k=
 *ar)
>=20=20
>=20 if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-8bit-qui=
rk"))
>  set_bit(ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK, &ar_snoc->flags);
> +
> + if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-skip-quir=
k"))
> + set_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags);
>  }
>=20=20
>=20 int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wirel=
ess/ath/ath10k/snoc.h
> index 1ecae34687c21..46574fd8f84ee 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.h
> +++ b/drivers/net/wireless/ath/ath10k/snoc.h
> @@ -51,6 +51,7 @@ enum ath10k_snoc_flags {
>  ATH10K_SNOC_FLAG_MODEM_STOPPED,
>  ATH10K_SNOC_FLAG_RECOVERY,
>  ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
> + ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK,
>  };
>=20=20
>=20 struct clk_bulk_data;
>=20
>=20--=20
>=202.53.0
>

Tested-by: Paul Sajna <sajattack@postmarketos.org>

