Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgihl-0005AU-Fp
 for ath10k@lists.infradead.org; Tue, 29 Sep 2015 00:23:38 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: CT firmware beta-15 can now do A-MSDU with IBSS interfaces.
Message-ID: <5609D9F4.4000407@candelatech.com>
Date: Mon, 28 Sep 2015 17:23:16 -0700
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Here is the changelog note.  This requires some corresponding driver patches to
enable the A-MSDU with IBSS because the ath10k hardware (or maybe firmware bug)
causes the BSSID in A-MSDU packets to be all zeros.

So, in CT 4.0 and 4.2 kernels there is a patch that allows all-zero BSSIDs
on IBSS interfaces.  Only tested on 4.2 so far.

This gives a modest performance gain, depending on RF environment.

I also have had a bug in the beta-15 rate-ctrl code for a week or two,
and I fixed that today as well.  Performance should be back up to
previous rates.


In addition, the ath10k firmware was always adding Legacy /b and /ag
IEs to probe requests, and the mac80211 stack was as well.  I have fixed
CT firmware to not crap itself when requested to not send any legacy
IEs, and this allows the host to have full control.  This also keeps
duplicate IEs off the air.  For backwards compat, if you want to take
advantage of this feature, you need CT kernels (or patches).


 From release notes:

   *  Allow disabling firmware-added legacy, HT and VHT related IEs in probe requests.
      The host can do a better job of adding these, and this keeps there from being
      duplicated IEs in probe requests.  Requires kernel patch to take advantage of
      these new features.

   *  IBSS:  Allow enabling A-MSDU for IBSS.  It appears there is a bug in the
      hardware or firmware that causes the BSSID to be zero when diong A-MSDU frames
      for IBSS interfaces.  I cannot figure out how to fix that, and it may just not
      be fixable due to hardware issues.

      But, the receiving host could be configured (hacked?) to just match on the
      destination address and ignore the BSSID address, and then it appears to work
      just fine.

      CT Kernel (4.2 now, maybe 4.0 soon) has patches to allow enabling IBSS A-MSDU
      in the CT firmware.  By default, A-MSDU is (still) disabled for IBSS.

      # Enable A-MSDU IBSS on wiphy0 radio.
      echo 0x500000001 > /debug/ieee80211/wiphy0/ath10k/ct_special
      # Disable A-MSDU IBSS on wiphy0 radio.
      echo 0x500000000 > /debug/ieee80211/wiphy0/ath10k/ct_special


http://www.candelatech.com/ath10k.php


http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-4.0.dev.y/.git;a=summary
http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-4.2.dev.y/.git;a=summary

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
