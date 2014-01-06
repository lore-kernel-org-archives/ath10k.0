Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22e.google.com ([2a00:1450:4008:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W060L-00044z-U4
 for ath10k@lists.infradead.org; Mon, 06 Jan 2014 08:57:50 +0000
Received: by mail-bk0-f46.google.com with SMTP id u15so5638421bkz.33
 for <ath10k@lists.infradead.org>; Mon, 06 Jan 2014 00:57:27 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 6 Jan 2014 16:57:27 +0800
Message-ID: <CAEFj987vWzG3SfDmpoURq_XDpMxAKeik3ogT8snsnThWrf37-g@mail.gmail.com>
Subject: WMI Parameters
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

I would like to change the beacon Tx Rate. Is this possible?

I have tried to change multicast_rate, mgmt_tx_rate, bcast_data_rate
or mcast_data_rate in struct wmi_vdev_param_map. But no luck, it won't
work.

Can someone advice.

Thanks

Regards,
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
