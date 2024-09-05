Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C6BCD4F59
	for <ath10k@archiver.kernel.org>; Thu,  5 Sep 2024 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:In-Reply-To:References:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xXH12nHQz7aEzM4VNnK8tIHRlyWLQsZTm3oQymSIk0=; b=uos/pFJxPoY5AMtDiG0Z+zZVQs
	Kf5DDi07Oc0SoP6qA/g5VPAebRRJv8sG0e6+iQeCbPGOSjFglvhAUOiCQwg0sK7Z9U7XuAgTqG/5b
	SYIdAm4/EAeyiBPe4F7TUSIEJnE3fa1mo80AGpzH59ak1Z/1GSfH+ZjQWOw248jYA0/5l+Txprl0y
	LY5zXgwOk6Gw/kLbeUbJ5f0MUa6vjS3GAQP1q3r7JfM5tVEgUuUAe1jXeS1OUO6dnxppoOsjgJqL6
	WcXe7U5h9rbSzQPete+H1x1BGdRF1oYAhizACpn6l+FZlKCj2E8Xn8s+1F8tPpVf9M7J0lzDHRSBZ
	F0Zrt+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6L7-00000007FuI-3N0Z;
	Thu, 05 Sep 2024 06:51:33 +0000
Received: from mxe-1-aa2.seznam.cz ([2a02:598:128:8a00::1000:aa2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6L3-00000007FsK-3P3s
	for ath10k@lists.infradead.org;
	Thu, 05 Sep 2024 06:51:32 +0000
Received: from email.seznam.cz
	by smtpc-mxe-85b96b7dcc-v4qq7
	(smtpc-mxe-85b96b7dcc-v4qq7 [2a02:598:128:8a00::1000:aa2])
	id 65a92bf99b5d99536527a5e1;
	Thu, 05 Sep 2024 08:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1725519082;
	bh=8xXH12nHQz7aEzM4VNnK8tIHRlyWLQsZTm3oQymSIk0=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:References:
	 In-Reply-To:Mime-Version:X-Mailer:Content-Type:
	 Content-Transfer-Encoding;
	b=egRCfIG/ie+S3drdGOWJmP3gzh30oOo6oKpwiJJHCmgMzBhhCJwVp5eeNzPbV6R6+
	 yV2w48S5PNgogrmD8WDM3vZTlghGGMJQpCj2F/19o6oZRSTQMIafQvJ5lh1VkRyivZ
	 S4WIxYRRNdFOzuDoLKwZEKNCSqBlrZls2Y/GgeAgfCYJ1XtBpQ1NSYlK+svxmun764
	 7I/2EEafhXJN8sHfBnVb3ulSdQq9w+qwzTiStWWlWhKq8JsfQbG43+2K5wVEvM5fMd
	 p9WHNTFbOsu5lmLpMjHyV1YHGZ+SLblc6mX7/0kgJcXnvDIUhwbVAUMbJkKOS5WodP
	 08/1gYp6I8g4Q==
Received: from 215-143.ktuo.cz (215-143.ktuo.cz [82.144.143.215])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Thu, 05 Sep 2024 08:51:21 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,
	<ath10k@lists.infradead.org>
Subject: Re: [PATCH] wifi: ath10k: add USB device ID for Atheros QCA9377-7
Date: Thu, 05 Sep 2024 08:51:20 +0200 (CEST)
Message-Id: <5J1.Zbdp.2t{MJKBvQ7h.1csLJe@seznam.cz>
References: <22t.ZbsX.5bWREDtSGGB.1cqQpF@seznam.cz>
	<8b7d9777-e239-4173-bec5-607e15b98130@quicinc.com>
	<56o.Zbc9.7x3xmPitckT.1csARP@seznam.cz>
	<c9f1100c-b34a-4d77-bfbe-1e20cf4143ef@quicinc.com>
In-Reply-To: <c9f1100c-b34a-4d77-bfbe-1e20cf4143ef@quicinc.com>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_235130_604388_77810DB8 
X-CRM114-Status: UNSURE (   8.12  )
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

> Ah, my good friend qcacld-2.0.
>
> I'd expect to see something written to kmsg, but not sure it is there fo=
r USB.
>
> for QMI there is: 
> 		ath10k_info(ar, "qmi fw_version 0x%x fw_build_timestamp %s fw_build_id=
 %s",
> 			    qmi->fw_version, qmi->fw_build_timestamp, qmi->fw_build_id);

> but looking at past ath10k USB changes I only see:
>     Tested-on: QCA9377 hw1.0 USB 1.0.0.299

> So I guess what you have is OK since this just allows you to be probed a=
nyway
> so that is actually independent of firmware version.

I cross-compiled the qcacld-2.0 driver and it printed this:

Host SW:4.5.25.50, FW:0.0.0.111, HW:QCA93x7_REV1_1

It looks like that 8devices is using their own firmware numbering.

