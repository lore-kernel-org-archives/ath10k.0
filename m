Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtdf5-0000dX-Ey
 for ath10k@lists.infradead.org; Thu, 19 Dec 2013 13:29:12 +0000
Received: by mail-bk0-f53.google.com with SMTP id na10so692168bkb.40
 for <ath10k@lists.infradead.org>; Thu, 19 Dec 2013 05:28:47 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 19 Dec 2013 21:28:47 +0800
Message-ID: <CAEFj986wMdEPuh=hRxL=6_CmWGp7eawB82+dq6M+c2EPVj9wNQ@mail.gmail.com>
Subject: Unable to receive beacon in IBSS mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi, all

I have observed if you create the interface in the ath10k as IBSS mode
(WMI_VDEV_TYPE_IBSS). The ath10k_wmi_event_mgmt_rx is not able to
receive the beacon frame. This maybe the reason when the STA up as
adhoc mode not able to join the network.

But if you put the ath10k as AP mode (WMI_VDEV_TYPE_AP), you are able
to receive the beacon.

Is this the correct behavior?

Please advice. Thanks

Regards,
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
