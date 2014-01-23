Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W69IH-0002f2-AK
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 01:41:21 +0000
Message-ID: <52E0732A.8030203@candelatech.com>
Date: Wed, 22 Jan 2014 17:40:58 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k:  Support rx-software-crypt mode.
References: <1390437676-19906-1-git-send-email-greearb@candelatech.com>
 <1390437676-19906-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1390437676-19906-2-git-send-email-greearb@candelatech.com>
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
To: ath10k@lists.infradead.org
Cc: kvalo@qca.qualcomm.com

On 01/22/2014 04:41 PM, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
>
> With appropriate firmware (probably only CT firmware at this time)
> this allows enabling rx-software-crypt mode.  This tells the
> firmware to not decrypt any packets received, but do encrypt
> (as needed) any packets on transmit.  This is implemented to get
> around hardware issues that preclude using two stations to
> connect to the same AP while using encryption.
>

I should mention:  This depends on a mac80211 patch I sent to
the linux-wireless mailing list.  It defines and uses the key flag
used below...

Thanks,
Ben

>   /**********/
>   /* Crypto */
>   /**********/
> @@ -77,6 +85,8 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
>   	if (cmd == DISABLE_KEY) {
>   		arg.key_cipher = WMI_CIPHER_NONE;
>   		arg.key_data = NULL;
> +	} else if (ath10k_modparam_nohwcrypt) {
> +		key->flags |= IEEE80211_KEY_FLAG_SW_RX_CRYPT;
>   	}
>
>   	return ath10k_wmi_vdev_install_key(arvif->ar, &arg);
> @@ -2792,6 +2802,8 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>
>   	mutex_lock(&ar->conf_mutex);
>
> +	key->flags &= ~IEEE80211_KEY_FLAG_SW_RX_CRYPT;
> +
>   	if (sta)
>   		peer_addr = sta->addr;
>   	else if (arvif->vdev_type == WMI_VDEV_TYPE_STA)


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
