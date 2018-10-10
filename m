Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAC4K-0001T7-AQ
 for ath10k@lists.infradead.org; Wed, 10 Oct 2018 10:50:21 +0000
Date: Wed, 10 Oct 2018 13:49:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] ath10k: add support for configuring management packet
 rate
Message-ID: <20181010104959.GA16248@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
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
To: srirrama@codeaurora.org
Cc: ath10k@lists.infradead.org

Hello Sriram R,

The patch f279294e9ee2: "ath10k: add support for configuring
management packet rate" from Sep 10, 2018, leads to the following
static checker warning:

	drivers/net/wireless/ath/ath10k/mac.c:168 ath10k_mac_get_rate_hw_value()
	error: buffer overflow 'ath10k_rates' 12 <= 143

drivers/net/wireless/ath/ath10k/mac.c
   159  static int ath10k_mac_get_rate_hw_value(int bitrate)
   160  {
   161          int i;
   162          u8 hw_value_prefix = 0;
   163  
   164          if (ath10k_mac_bitrate_is_cck(bitrate))
   165                  hw_value_prefix = WMI_RATE_PREAMBLE_CCK << 6;
   166  
   167          for (i = 0; i < sizeof(ath10k_rates); i++) {
                                ^^^^^^^^^^^^^^^^^^^^
Should be ARRAY_SIZE() instead of sizeof().

   168                  if (ath10k_rates[i].bitrate == bitrate)
   169                          return hw_value_prefix | ath10k_rates[i].hw_value;
   170          }
   171  
   172          return -EINVAL;
   173  }
   174  

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
