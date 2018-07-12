Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from santino-notr.mail.tiscali.it ([213.205.33.215]
 helo=smtp.tiscali.it)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdiiC-0000j7-74
 for ath10k@lists.infradead.org; Thu, 12 Jul 2018 21:01:17 +0000
From: "M.T." <masnia@tiscali.it>
Subject: Received unexpected tx_fetch_ind event: in push mode
Message-ID: <58dafc9c-8153-63d4-cf64-652fcd5fc5e5@tiscali.it>
Date: Thu, 12 Jul 2018 23:00:59 +0200
MIME-Version: 1.0
Content-Language: it-IT
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi,
I recently installed OpenWrt 18.06 snapshot (r7106) with =

firmware-5.bin_10.4-3.5.3-00057 on AVM Fritz! Box 4040 and after a few =

days I saw that in the kernel=A0 log there were these warnings:

[96438.552358] ath10k_ahb a000000.wifi: Invalid peer id 14 peer stats buffer
[131439.527370] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode
[131439.527709] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode
[132036.188659] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode
[132036.188709] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode
[132036.195871] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode
[132036.204113] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode
[194619.298165] ath10k_ahb a000000.wifi: Invalid peer id 21 peer stats =

buffer
[214540.478860] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode
[302691.452861] ath10k_ahb a000000.wifi: Invalid peer id 38 peer stats =

buffer
[302750.503109] ath10k_ahb a000000.wifi: Invalid peer id 37 peer stats =

buffer
[395035.371422] ath10k_ahb a000000.wifi: Invalid peer id 45 peer stats =

buffer
[649571.634993] ath10k_ahb a000000.wifi: Invalid peer id 89 peer stats =

buffer
[837906.946895] ath10k_ahb a000000.wifi: Invalid peer id 115 peer stats =

buffer
[895769.805975] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode
[896666.298360] ath10k_ahb a000000.wifi: received unexpected =

tx_fetch_ind event: in push mode

The wireless configuration is AP with default options, I have only =

activated WPA2 AES security, 8 clients connected to 2.4 GHz and 3 =

connected to 5 GHz.

Is there anything I can do?

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
