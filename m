Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1azxAa-0007yV-AG
 for ath10k@lists.infradead.org; Tue, 10 May 2016 02:13:08 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Crash related to c4cdf753 (move fw_features to struct ath10k_fw_file)
Message-ID: <573108D9.7020304@candelatech.com>
Date: Mon, 9 May 2016 15:02:01 -0700
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>

I think that second chunk should use fw_file->fw.features instead of ar->running ... ???

It crashes everytime for me (wireless testing from a few days ago).

@@ -1074,13 +1074,13 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
                                         ath10k_dbg(ar, ATH10K_DBG_BOOT,
                                                    "Enabling feature bit: %i\n",
                                                    i);
-                                       __set_bit(i, ar->fw_features);
+                                       __set_bit(i, fw_file->fw_features);
                                 }
                         }

                         ath10k_dbg_dump(ar, ATH10K_DBG_BOOT, "features", "",
-                                       ar->fw_features,
-                                       sizeof(ar->fw_features));
+                                       ar->running_fw->fw_file.fw_features,
+                                       sizeof(fw_file->fw_features));
                         break;
                 case ATH10K_FW_IE_FW_IMAGE:
                         ath10k_dbg(ar, ATH10K_DBG_BOOT,


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
