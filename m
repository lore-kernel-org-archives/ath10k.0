Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCscf-0003CY-3O
 for ath10k@lists.infradead.org; Thu, 31 Jul 2014 15:50:31 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 31 Jul 2014 17:49:49 +0200
Subject: RE : [PATCH] ath10k: fix aggregated 4addr Rx
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F15C1D805@srvexch01.SODIELEC.local>
References: <1406205374-24858-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1406205374-24858-1-git-send-email-michal.kazior@tieto.com>
Content-Language: fr-FR
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "greearb@candelatech.com" <greearb@candelatech.com>

Thank you for the patch. I applied it (manually not automatically, the patc=
h is not based on ath-master branch?)
The warning msg: br0: received packet on wlan0.sta1 with own address as sou=
rce address disappeared on the console of my AP.
But the performance of my bridged STA (using CT firmware) is still lower th=
an non-bridged STA (10.1-467 firmware).
(520 vs 550 Mbps)

The processor of my AP is not exhausted (about 15-20% idle) but perf top on=
 my bridged STA show that there is this thread: br_fdb_update.
I didn't see it on non-bridged STA, it takes 5% resource of the processor
I look for it on google and this thread is related to the warning message b=
r0:received packet on wlan0.sta1 with own address as source address
Do you guy have any suggestion?

Thanks,
NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

________________________________________
De : Michal Kazior [michal.kazior@tieto.com]
Date d'envoi : jeudi 24 juillet 2014 14:36
=C0 : ath10k@lists.infradead.org
Cc : linux-wireless@vger.kernel.org; Vu Hai NGUYEN; Michal Kazior
Objet : [PATCH] ath10k: fix aggregated 4addr Rx

A-MSDU 4addr frames weren't reconstructed properly
and in some cases this resulted in a warning:

 br0: received packet on wlan0.sta1 with own address as source address

Since this was only related to A-MSDU it would
trigger when more intense traffic was generated.

Reported-by: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireles=
s/ath/ath10k/htt_rx.c
index 318efc3..a8328f9 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -859,7 +859,7 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
        enum rx_msdu_decap_format fmt;
        enum htt_rx_mpdu_encrypt_type enctype;
        struct ieee80211_hdr *hdr;
-       u8 hdr_buf[64], addr[ETH_ALEN], *qos;
+       u8 hdr_buf[64], da[ETH_ALEN], sa[ETH_ALEN], *qos;
        unsigned int hdr_len;

        rxd =3D (void *)skb->data - sizeof(*rxd);
@@ -897,10 +897,11 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *ht=
t,
                        skb_trim(skb, skb->len - FCS_LEN);
                        break;
                case RX_MSDU_DECAP_NATIVE_WIFI:
-                       /* pull decapped header and copy DA */
+                       /* pull decapped header and copy SA & DA */
                        hdr =3D (struct ieee80211_hdr *)skb->data;
                        hdr_len =3D ath10k_htt_rx_nwifi_hdrlen(hdr);
-                       memcpy(addr, ieee80211_get_DA(hdr), ETH_ALEN);
+                       memcpy(da, ieee80211_get_DA(hdr), ETH_ALEN);
+                       memcpy(sa, ieee80211_get_SA(hdr), ETH_ALEN);
                        skb_pull(skb, hdr_len);

                        /* push original 802.11 header */
@@ -914,8 +915,11 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
                        qos =3D ieee80211_get_qos_ctl(hdr);
                        qos[0] &=3D ~IEEE80211_QOS_CTL_A_MSDU_PRESENT;

-                       /* original 802.11 header has a different DA */
-                       memcpy(ieee80211_get_DA(hdr), addr, ETH_ALEN);
+                       /* original 802.11 header has a different DA and in
+                        * case of 4addr it may also have different SA
+                        */
+                       memcpy(ieee80211_get_DA(hdr), da, ETH_ALEN);
+                       memcpy(ieee80211_get_SA(hdr), sa, ETH_ALEN);
                        break;
                case RX_MSDU_DECAP_ETHERNET2_DIX:
                        /* strip ethernet header and insert decapped 802.11
--
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
