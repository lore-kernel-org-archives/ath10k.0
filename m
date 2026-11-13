Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCE2606A332
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 20:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=duVQWonG;
	dkim=pass (2048-bit key, unprotected) header.d=tawheed.cc header.i=@tawheed.cc header.a=rsa-sha256 header.s=sig1 header.b=tMt4SuzH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=THyP5ccffzfLdPOgFJzY9lfrX5K9m1v3n9FUvlvgq2k=; b=duVQWonGWOicIm
	PQOMPVdnnYbCuTBHyjLo28hONO0HRe2EIkSY8bGNqO1bux+ja8Y8hr+JYv0gb4m0afLjDwMR0AWGF
	DphWgWwe15QzZFo2ehhTFHcEgxOwtUcSJxTf4SddQPFKxXppDdlOSi7KqY/sZE/v57NoOZtns4861
	wowtLumiej40CqNiIE/6tq99Aiyn3Xp2IrOXTQnbrfVQUpXxydMRjaTjJoGssyyyNzVr6XeVuDz/d
	1PF76fBgWBTOwaHh1vNrfwow+vhPebk42argfu9TWCWjHDLR3egOt24OiTXD/pu2lnYnv/A5Cd/nV
	xh0HCpLOyyvQqFPlchog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyJH-0000000EV8F-0uzW;
	Fri, 13 Nov 2026 20:55:47 +0000
Received: from pv-2005a-snip6-11.eps.apple.com ([2a01:b747:3003:202::b] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyJF-0000000EV7l-0kBN
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 20:55:46 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-10 (Postfix) with ESMTPS id 3063B18000AA;
	Fri, 13 Nov 2026 20:55:39 +0000 (UTC)
X-ICL-RepId: 01a1d6b1-cdaa-7b71-810d-b8805f28ca42
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tawheed.cc; s=sig1; t=1794603339; x=1826139339; bh=THyP5ccffzfLdPOgFJzY9lfrX5K9m1v3n9FUvlvgq2k=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=tMt4SuzHqMi5jtry/NB/hulQIcFTwU+j1c3CIDG3lIQknTtUp0p+gQlUpWLIvhTHoagAN4gXF3h3KUPRLSBbIdAPPXyhf5m0hSqQRKuRsHF0zjFUc0fgpoC+DOCDLoUoBwElRUhjhAsiX0IUnuptxM39AVCQuEwyRthFrtA5MRc2aNZYqrZ8rAOYHfHQPMgiVDMYT7BjpRO8kGRx2m7P9c6T9arjK5CaS9ZNBz9HBm5P2l6cFd5OUeDSqAoPbtS5x2qYLE113iQNqMX8Sma/YvOAKsm7xcQzdt9ALAhAFkePwdPLs1I14Z9P6qj0YCCbnF5TNmaKXu6V/GOVOPdUZQ==
mail-alias-created-date: 1711150425226
Received: from DESKTOP-HUABEFD.localdomain (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-10 (Postfix) with ESMTPSA id 03F46180011F;
	Fri, 13 Nov 2026 20:55:37 +0000 (UTC)
From: Tawheed Makhdoomi <_@tawheed.cc>
To: Shunsuke Nagashima <shunsuke@nagashi.ma>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Conn O'Griofa <connogriofa@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Fabricio Akio <fabricioakio@gmail.com>,
	Aleksei Kharlamov <aleksei.kharlamov@gmx.de>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
Date: Fri, 13 Nov 2026 15:55:33 -0500
Message-ID: <20261113205533.3021-1-_@tawheed.cc>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma> <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma> <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com> <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com> <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com> <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com> <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com> <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=dLmrWeZb c=1 sm=1 tr=0 ts=6af7794b
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=JUyVuPN3Gk7WIszG6mYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4MyBTYWx0ZWRfXxUg8lTjRMXXR
 OPlmM4KUHmDY7c0BXnaXAmg72fHmCPBESqIpauUrTD3hGGboPCbLoznoLwUzQZhVwGxJ+kJYrjx
 tM9bU/GXOZ8pMFanOkoAve/CEx+arHJBgivnZsCc/hKhHsuSExg9B66blVUju16vePvkmeNvw8/
 x9735S4tcQ+bOHII2GyE7m6dzvRM/2EHBylD+RikxIYSPdMr5fjd24OKLU5LF3BbfqlttIZa778
 4HzeJ+MQYzOMbOn2hg0HQmDGIaV36jWOlxJgrubFHhfOSx+C2NFAe+XW60e3zrQv5180ku8nMjV
 OwyRnIEMt8urLw9umBVW0C4aTrbsbhFS7Km95vXVB7RlUJt00wkS7h7zJbBZzo=
X-Proofpoint-ORIG-GUID: D0a78clfvBwuTXHcIQkRvdx8MxzYXoVf
X-Proofpoint-GUID: D0a78clfvBwuTXHcIQkRvdx8MxzYXoVf
X-JNJ: AAAAAAABO+x53SqNxPbtLvynpfGO7ehFer3EmRKvA8qD6cR76TJf8+YcGAk0h3SWATAInN
 aWpyXyBusqyjbG4U5UWzaLEBi3OVOuYUFh18vMVxtz9lfGk4NT/WAhQ4Jmapbpio+Du8P6
 kZklTo48AAGiI67kT+416MH1BfrqSIq3xwYL4jkW/9+grxcXdfEWGSnpNR+iZnzDKqSfQn
 p0jFy+N3DHi/182RmW9JiSqjzTA8cFaUYAvufncJm24pcVI65M7LS335Wx8TSuWXcc41oe
 cNui0xa9NlwhLYq16e3hHEIJ+jUjqbaK/Yk32GnoWTUXxG7GEPxrCCUxgkcM/KDJkQqvdS
 QAn7FPH01NxYSeConwCeuBaL+AmdPCE7aO8B36KPeG85UUhW1bYc0dcoanUfKnB1rH3DoV
 qKcjMuC3usc1xprbxQmFEigEPk3iQzLBBKDvywDuTTdKJlOD+z9MF4sb+QcSxTLGxkW7za
 ZDbfqX/eRh/K2PB21nX/1hHI9B5lZd77F41WM0OX7pgCnJKj/yp2Krcj9OO0hG4lQToVRv
 2ACdwyKiJQ/ITxb3fD0OuZ1EKy27OqdbKRjlazdgfxPNLR4vl/zf3d6HK18N3rMT/P4DAV
 wNTxSVvSCpgzMJUx2bjCurPs2rsZWyq6D3ZwEb/GBjGrNkmzX8/jl+w3cS3DhPyXZTIfQG
 o8/LyC5VaDZIY8eIH1gZ60y2P2Rcjae5HPo7VVzog2uBd7z1TIElwZgYL677fKgWx6K5g7
 PFFev05jU9ZQnZKZ7Fl0JoD4AfnoXBeZCXYr99if5tSnuyHLGmlNFAnG44yp5kXBW8fiim
 5zZl9BMMsknCnKWQAGCPsHTu2XY+ItiOIS/Cj9ZwvqompBxQDVw+BEPe+90OrmVa3GOA+B
 vi/PYG5fajr8q2YhOLRO0olTo16kkX72J3PdfCJoao6UZ6mNznjR7UqtX9W/IUbUbHmj5a
 kATjMmX/rJeLPty/X3XXlIRNzSU+km3xMrnrtG9PJ/X5V+mESDtDPZVwauB7ipd69R9O/j
 /Orq9OdhzTFvlV8t0Gvubu+pm+JMvPIPOBtJJ2khAi6yOPPVaFQu0qhPzf7UqZlY+zmiIv
 q3T8LA4n4tgNl9luazVK6MhWY4OZkCEUhM/4vS7bGHrK9SDYKUtyc7B9kEjk0ufV2Sjv1S
 2XXYhf7vMrR1/vDuz+A6ZBT3eZi1IgQQG6R4c5+aC+otm1L3fWBduEjPPlawbe3/ScHj6q
 sSiNLburAv7eK9Tn6VJZ9cgyc3DUga7Cb1LDdyEUfLIDQBVTwwHfSZ6zpaZ/VLAvpVs15u
 bj3lPCg7f+hYuQwghHel9ij8cno71Th1oOUmqkyXFEnk+88Cmw77Tq0VDKIOyQdmsoAKcb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_125545_251743_99D71369 
X-CRM114-Status: GOOD (  10.80  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A data point for the shared hw1.0 file. It is not the db845c/axolotl
test you asked for: this machine uses that firmware-5.bin with a newer
WLAN.HL.3.2.0 build, not 01387.

Hardware: Microsoft Surface Pro X (SC8180X, WCN3990 via ath10k_snoc),
firmware WLAN.HL.3.2.0.c8-00428 (wlanmdsp from the machine's Windows
install), kernel 7.4.0-rc2-next-20261109. The firmware-5.bin is the stock
ath10k/WCN3990/hw1.0/firmware-5.bin from linux-firmware (60 bytes, feature
IE 40 00 0c), so the driver logged

  features wowlan,mgmt-tx-by-reference,non-bmi

Access point: 5 GHz, 80 MHz, HE, WPA3-SAE with PMF required. A second
node of the same network without PMF served as the control.

Before, stock file:

  PMF AP      1.3-2.1 MB/s down, 1.7 MB/s up; ping to the gateway: about
              55% at 2-20 ms, the rest at ~105 and ~205 ms
  non-PMF AP  8.8 MB/s down (limited by that node's wireless backhaul);
              ping 2-27 ms, no 100 ms steps
  Windows on an identical machine, PMF AP: 30-33 MB/s, ping 1-2 ms

(MB/s is megabytes per second, HTTP download of a 20-50 MB file.)

With HTT debug the delay showed on both legs in ~102 ms quanta: tx
completion came either ~1 ms or ~100 ms after the tx, with ACK status and
no TCP retransmits. I had not found the reason; the unprotected ADDBA
described in this thread fits what I saw.

Things that made no difference on the PMF AP: power save on/off (the
driver does send the psmode disable), the ath10k thermal throttle state,
all nine board files from the Windows package, Bluetooth off, removing
the P2P device, IOMMU strict/lazy, CPU idle states.

After setting only the mfp bit in that file (feature IE 40 00 0c ->
40 10 0c), nothing else changed:

  features wowlan,mfp,mgmt-tx-by-reference,non-bmi
  station dump: MFP: yes

  PMF AP      10-29 MB/s down over ten runs after a reboot (Windows on
              the identical machine in the same minutes: 13-25 MB/s),
              4.6 MB/s up; 60 of 60 pings under 20 ms

No regression seen on the non-PMF node, and no firmware crash in a few
hours of use. I have not tested AP mode, WPA2 with optional PMF, or
2.4 GHz, and I have not yet run the iperf3 and reconnect steps of your
test procedure.

So on WLAN.HL.3.2.0.c8 the shared hw1.0 file works with mfp-support added.
I have two of these machines and can test a proposed update of that file,
and give a Tested-by for it, if that helps it along.

Thanks,
Tawheed

