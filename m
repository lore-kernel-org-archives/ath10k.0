Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EEDC433F5
	for <ath10k@archiver.kernel.org>; Tue, 15 Feb 2022 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5d1P/mqmCVYEJJNRzH1lr4nDZ+A8LMN+wbfFypmJSDM=; b=myi
	sXwdSSQaslwdq7dprAdn4Knas8wY3XDrVoFBN5DR3pSQ4fw+N2+RuiyOygCVW1xx/GJsMWel5KPBK
	cALzRWQ0XBRClG5xojKw66AGtfT1CKZDGkZKBejc1wHPI5UCbKgdDg8/FbO/Mn5D2NxG/E9qir6lW
	rMHm/6+Ywkd3qxv3zm/tSBVsUfBpRJ+SLeqTOkSQqr/1SofZsMOB2oO74A8guvPu+VJlHftiXbemz
	OLrByQ3EVe+nPu4Hf5fetCil63263E/6OJ9+fTz4R7qFN4PP+COPA8znYfyPDYm/S8wfPMWi7Fo74
	4VTLT4Ckn57rcdqrKfcSVYDcIOPV6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK7Uz-004xBx-UN; Tue, 15 Feb 2022 23:44:45 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK7Ux-004xBT-5d
 for ath10k@lists.infradead.org; Tue, 15 Feb 2022 23:44:44 +0000
Date: Tue, 15 Feb 2022 23:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1644968679;
 bh=BZ0BUBQpcPMJzJ5faEezUYAIkBFiZXqQEBKwjJTpSEk=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID;
 b=tEKAWlHVSoqF9m67c1/sMXKwNdOQecFx/hbToC1kFuce7UDS+vl9M2hV3n4F0Q8i9
 QdHSl9i5+37NlZt/49WHlne4FX8G/RDfCC8/KsrlB47nm/cVRSmkgYduBbngdIYrC1
 GmVx4z7SXsAcapDG9myQlzK9sTkvKYCWYWPz2R79MOUx2d1cTY3uUd1tKs6nFWX1am
 5QBVOkfpJVAZ0I9+8iiza0xmhwPx0V6iQGZeA1B0bJ3x7FsbWc9UQdobi8tnl/nKxC
 fTQOZsuJIaQdkwrmw3fxMoIOkCw7TX0N1PE7Q4mLRe03Aj3nHw0ewIobsFArERMJ5g
 MAV7Ed4W8FblQ==
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
From: Michael Yartys <michael.yartys@protonmail.com>
Subject: 9984 firmware doesn't respect minimum basic rate
Message-ID: <e1XzpqBFxcvO3rkpc14IJrbQUhlZBtwAcBjvD_cFnRSU1h7PPjK_OFPMk8TgAz116lso_-fJipAB1bwJTRmZNTELHDOeDTbAwzlA14jDpSg=@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_154443_407493_D4EB5103 
X-CRM114-Status: UNSURE (   1.89  )
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
Reply-To: Michael Yartys <michael.yartys@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi

I've noticed a bug in the firmware for the 9984 where it doesn't respect the minimum basic rate setting. I set both my 2.4GHz and 5GHz networks to a minimum basic rate of 12 Mb/s, but the beacon frames are transmitted at 1 Mb/s and 6 Mb/s, respectively. This bug goes a long way back, and the last two firmwares that set the rate correctly are from 2018:

firmware-5.bin_10.4-3.5.3-00053 - WORKS
firmware-5.bin_10.4-3.5.3-00057 - WORKS
firmware-5.bin_10.4-3.5.3.1-00006 - FAIL
firmware-5.bin_10.4-3.5.3.1-00009 - FAIL
firmware-5.bin_10.4-3.6-00140 - FAIL
firmware-5.bin_10.4-3.9.0.2-00131 - FAIL
firmware-5.bin_10.4-3.9.0.2-00156 - FAIL

Michael

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
