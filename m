Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43268E77197
	for <ath10k@archiver.kernel.org>; Thu,  9 Jan 2025 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W81NM/aAsn0km28xNBRfVumWprgAsipiPyT2j51YIA8=; b=cIDUalCYnfwbmf4nHf0LM7cXyC
	YWZKzuHoV9rp2MHV+CVOgNBf734nnWw9UG1D22O1u9yss5JFa2YXisLlbPOxYthYLcZsUkd9RrVvB
	3LTsvLzQ7MfFQM+Qh0xhGIsUVoE0zW4bD/Vn4xnoRokyQV3DtKMtqPdaaw1dq7ZpdLmLUdTL78lDG
	C+2MiTFcBgwaMnNfTJhIBji8wKWQtWgnShnA2P1moYetPuWsWFl0BpfG3rFH7Y36ToaRmhs43oMpS
	LMZeOOxmed9J1dVRUFyASnn+Xy4SNHm7djNg/gtoIyi8/uaNpd+ZBAJV3yWL4KREg509GMeY4hHAz
	JFP/DLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVt4l-0000000C8iV-1X63;
	Thu, 09 Jan 2025 13:59:55 +0000
Received: from e3i103.smtp2go.com ([158.120.84.103])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVt4i-0000000C8gf-0cTW
	for ath10k@lists.infradead.org;
	Thu, 09 Jan 2025 13:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1736431184; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=W81NM/aAsn0km28xNBRfVumWprgAsipiPyT2j51YIA8=;
 b=hoyqWEUbOYROae5wn200ya1EDbWytTM0aIBaSZPmrEWcrcyXuRfWqGubzd9Q88ul5TwX/
 DBdtchaqXcAURonkKhO5ncyOUgVX5wytauFVnix63YDj1JKPZ6og3r8jvui5d0CWGqff5y2
 x51xoxMFs9fN7yBtAFBRX/G5pyXsTgt3j0ll+fk6laWYRIst5BYFagZX+rwQSb38ieszu8a
 sG18hEfH97R4GBY8njJ9nI9XJbsXRYAfdQimuM+T7+osX76Mloa7LT1rRd2CJNyvh6M1294
 TE7jTdxybAXFIbI7M2Tuncygx8AtZXBGNuufFEmreTSQDfyfekrLjLbjEwgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1736431184; h=from : subject
 : to : message-id : date;
 bh=W81NM/aAsn0km28xNBRfVumWprgAsipiPyT2j51YIA8=;
 b=VXnOHx1XDlL+vBHgUowQqbtEBvXm8YkFpth7a0xbTMjEJ5v+UtTRzifnhtcZLumg4FaCF
 jkZhsC8SGE0iAY/nKqyIvM2Ad1gDagcfy9zYPxbFyPCZYxvY47PcDQgfPNt7cuhK87JVyhL
 Fq2IEg/bTBB9zQpmbtC9qrryahLqKUZpxq9zFXBgTM2a5c4xytkxJo8wbRb6kVA1+ZAuUGb
 n2PoNdwXbhpJFBJvBdvrcFRDnCzE3bpAwlJcj+/vT0K3PicGg2wem/Q0Ajq+bs3T6Ugs5iz
 C/5M69G8S80hWmvL3tiS+kd3Y7s6c65F2ySFjLmV3XoNJ3Q9qmibpkKLPfig==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1tVt4R-4o5NDgrjoLk-mRMC;
	Thu, 09 Jan 2025 13:59:35 +0000
Date: Thu, 9 Jan 2025 14:56:35 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
	Cedric Veilleux <veilleux.cedric@gmail.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Subject: Re: [RESEND PATCH v3 0/2] Improve ath10k flush queue mechanism
Message-ID: <Z3_Vk6doGyavKSea@pilgrim>
References: <cover.1732293922.git.repk@triplefau.lt>
 <87ldvkdtqn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldvkdtqn.fsf@kernel.org>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sMuY_9l13u
X-smtpcorp-track: CPYWzM2uguN_.iz_KISedMzJH.aB6kGQqUoDr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_055952_629271_EE9C1D91 
X-CRM114-Status: GOOD (  23.30  )
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

On Thu, Jan 09, 2025 at 03:03:44PM +0200, Kalle Valo wrote:
> Remi Pommarel <repk@triplefau.lt> writes:
> 
> > It has been reported [0] that a 3-4 seconds (actually up to 5 sec) of
> > radio silence could be observed followed by the error below on ath10k
> > devices:
> >
> >  ath10k_pci 0000:04:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
> >
> > This is due to how the TX queues are flushed in ath10k. When a STA is
> > removed, mac80211 need to flush queues [1], but because ath10k does not
> > have a lightweight .flush_sta operation, ieee80211_flush_queues() is
> > called instead effectively blocking the whole queue during the drain
> > causing this radio silence. Also because ath10k_flush() waits for all
> > queued to be emptied, not only the flushed ones it could more easily
> > take up to 5 seconds to finish making the whole situation worst.
> >
> > The first patch of this series adds a .flush_sta operation to flush only
> > specific STA traffic avoiding the need to stop whole queues and should
> > be enough in itself to fix the reported issue.
> >
> > The second patch of this series is a proposal to improve ath10k_flush so
> > that it will be less likely to timeout waiting for non related queues to
> > drain.
> >
> > The abose kernel warning could still be observed (e.g. flushing a dead
> > STA) but should be now harmless.
> >
> > [0]: https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
> > [1]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")
> 
> On what hardware and firmware did you test this? As they can behave very
> differently knowing that is really important.

This was tested on QCA9888 hw 2.0 10.4-3.10-00076.

Not sure to see how a different HW/FW could have prevented that though.

-- 
Remi

