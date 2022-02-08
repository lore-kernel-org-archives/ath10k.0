Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0643C433F5
	for <ath10k@archiver.kernel.org>; Tue,  8 Feb 2022 19:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=TFudZfSp91pQ0zp2Yoj2pZ1pzxGD9nKawx6myL2+d/w=; b=hoo
	jMgfmc1RCkOnPV0frJsfgz/NH07SrgyGpNF3zC+ZhwJ6cuwGWH52ebDRwAjYkEYBj9GuWNKnbB81S
	1OC07bPd+7gmy1OkfVbORz8DM6fcIJ7YU5KsJSW/1l/RmYsZpIB3Wpm7Cxkm8hbRxnzNGKTGsY+kZ
	2FhtjUn6knef1qs8ug/4cNEMiTuUSQ3rEQe2SNLwd6UZGCuYtuAB2STEL+2l9+b+A1tnL6qrpkJDw
	8LlXe7YGq91aBA0rTdgUCFnkT5MPIWgCKJDZG/e53frb/HEAb58NpfC2iXJ1pXWcw9xhcOjvgxPjz
	+86OCz4i0GVbW7ljcrL2cW2zD6JRCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHWDZ-00FPzK-BD; Tue, 08 Feb 2022 19:32:01 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHWDW-00FPyY-W6
 for ath10k@lists.infradead.org; Tue, 08 Feb 2022 19:32:00 +0000
Received: by mail-qv1-xf35.google.com with SMTP id d7so61913qvk.2
 for <ath10k@lists.infradead.org>; Tue, 08 Feb 2022 11:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=EgUSYBmJYsgJD2lOVsg4fyFQsxXZ/RPmrrlksQ3fpPM=;
 b=chyn3o5lusUhIjjtlvLwg8DN/tGbL4gZz5Wose9VImQsQYkgeyoijX3Ujl2NPIW+89
 TA2ezxr/aWtYe9yzaZ76zMdUFr0MXC1dRGQMJa/ZTqJ7dYeo1T2Wr9fiC52Y4d///vFN
 w7WGcAc4QetSFamNfx5XONLKr/jLTk1v8oEeLtyehA/2Jl+GRUi0JqJDLsEAypwHTCs3
 Q54NQw5EK8oeM5PjG5nU6JEATEbzlmoKE/Zll4O2+3rIWlC70IQRhj+m1m4BEl5LxHCI
 Lr6YjlCJQ6aSs1sV2bzzLPH8/kOM/KV9LCUz2vz+RrgjCCc4/cqEt9WuRJqKHoQMhmr9
 GtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EgUSYBmJYsgJD2lOVsg4fyFQsxXZ/RPmrrlksQ3fpPM=;
 b=udzs+Kkht3BbQCu9cXSedhUrAjhTlZ+t8PsKLZ929am6HLHgnS9cfAhAcSQ0mjiYU3
 aUx0z3VkfScIh9P6J/oNBqGkClAqS8lKebTVrCxnZltNWmmMEjQ4uQpUr030RUB7OaBa
 tcWFZHJpdAuOGuX5a1vVdjEvxYJbQcnYVB/Yq1XA/298aaApmJlDjNoN7xUopBN/rqTg
 vipHadBldFnHznbb8w6V8FtqWolod0SPgAntH2OSNuJLYSnBJAJq2NT/D+kZlgEvdrrP
 nKOq8d5Q9mVxOoDQ/Lc9WgLJriLBNKnPGDhr3RWaVErZdsW4MNZlNj04m2mKwPaj53AC
 4yhQ==
X-Gm-Message-State: AOAM530d79kTqkM8SaCjQFHqOHhycytk8ulLHg4NZ1wFlGCYRdiBFMzy
 JiNLOzYwM91kAcLke7e6tKitPpKwGc3ydKiCbNpACH/DEbI=
X-Google-Smtp-Source: ABdhPJxKCd1vq7UQ3Nj7Iem3DdCAPrbB8WvFaTCUfb1lTp5H1oEBq/K6H98bQK/1JcE9Ns4OdE5/i95j2nr8fyrOIks=
X-Received: by 2002:a05:6214:4007:: with SMTP id
 kd7mr2096350qvb.75.1644348716562; 
 Tue, 08 Feb 2022 11:31:56 -0800 (PST)
MIME-Version: 1.0
From: Guilherme Weidle <guileweidle@gmail.com>
Date: Tue, 8 Feb 2022 16:31:45 -0300
Message-ID: <CAKBt_AeMSV8Z98bZh3saK8G61e9m8JNXZrLmNT2oJsvAHJNTZg@mail.gmail.com>
Subject: push-pull stalls (QCA 9888)
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_113159_059757_5BB7AA96 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

I'm suffering from a bug where in AP mode, the TX queue stalls.

If I connect 5 stations and force some traffic (bandwidth test for
instance), the AP's TX queue seems to stall (no data frames are
getting out).

I can reply this issue by using another device (ath9k) with 5 virtual
interfaces (stations) connected to my AP (ath10k). Then, I start iperf
server on that device and start one iperf client (from AP) per
associated station. And just like that, AP stops sending data frames
and I no longer be able to ping any connected station.

If I do the same test, but with 4 stations instead of 5, it works just fine.

As far as I could see, it is related to PUSH-PULL mode. As soon as the
WLAN firmware switches to this mode, the issue happens.

Just as a test, I change the ath10k_mac_tx_can_push() to always return
true and the issue goes away.

Does anyone also came across this issue or have any idea how to solve it?

PS: This product is using kernel 4.4.60 and backports 4.19.137-1. I
also updated to backports 20210222_001 and the problem still there.

Regards,

Guilherme Weidle

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
