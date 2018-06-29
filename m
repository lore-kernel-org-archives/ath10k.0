Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYkmU-0001gW-P0
 for ath10k@lists.infradead.org; Fri, 29 Jun 2018 04:13:13 +0000
Subject: Re: 160 mhz crash
References: <CA+_ehUzDW8Y9OYYPCijxxGmpp+UZFWySzj0FcQcQDncMu51kjQ@mail.gmail.com>
 <1788770.Stodcpyumm@bentobox>
 <63afefbf-3ec2-786a-7ad1-e5e545da0617@dd-wrt.com>
 <2659853.3HgnkKbIzR@bentobox>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <3046082d-df3e-237d-9fd4-d2af67ffc0de@dd-wrt.com>
Date: Fri, 29 Jun 2018 06:12:57 +0200
MIME-Version: 1.0
In-Reply-To: <2659853.3HgnkKbIzR@bentobox>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, ath10k@lists.infradead.org



Am 28.06.2018 um 14:24 schrieb Sven Eckelmann:
> On Donnerstag, 28. Juni 2018 11:56:39 CEST Sebastian Gottschall wrote:
>> btw. openwrt imported my patches recently, but with some openwrt
>> specific modifications
> Thanks, just tested these [1]. It doesn't crash anymore and at least the basic
> functionality seems to work.
>
> On Donnerstag, 28. Juni 2018 11:56:02 CEST Sebastian Gottschall wrote:
>> i understand that. but i dont see a problem with the code style
> Your commit message contains things which don't belong there (the changelog of
> the different version) and you don't follow the rules about line length in the
> commit message or subject. Also checkpatch.pl panics when seeing your
> changes [2,3]:
never saw a warning posted. here on the mailing list about line length 
etc. and about code line length
how to define this

(BW_NSS_FWCONF_MAP_ENABLE | (((x - 1) << BW_NSS_FWCONF_MAP_160MHZ_S) & BW_NSS_FWCONF_MAP_160MHZ_M))

with a line break it turns unreadable and looking like shit. and this code is a definition taken from the original wmi headers from qca.
if its more than 85 characters. i'm fine with that. there is no way to change it
i need also manually to edit this old patch. i deleted already the trees which i used for writing it

>      ------------------------------------------------------------------------------------------
>      ath10k-160mhz/v1-ath10k-fix-band_center_freq-handling-for-VHT160-in-recent-firmwares.patch
>      ------------------------------------------------------------------------------------------
>      WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
>      #17:
>      starting with firmware 10.4.3.4.x series QCA changed the handling of the channel property band_center_freq1 and band_center_freq2 in vht160 operation mode
>      
>      WARNING: 'compatiblity' may be misspelled - perhaps 'compatibility'?
>      #18:
>      likelly for backward compatiblity with vht80 only capable clients.
>      
>      WARNING: line over 80 characters
>      #62: FILE: drivers/net/wireless/ath/ath10k/wmi.c:1681:
>      +                       ch->band_center_freq1 = __cpu_to_le32(arg->band_center_freq1 - 40);
>      
>      ERROR: trailing whitespace
>      #64: FILE: drivers/net/wireless/ath/ath10k/wmi.c:1683:
>      +^I^I^Ich->band_center_freq1 = __cpu_to_le32(arg->band_center_freq1 + 40);^I^I$
>      
>      WARNING: line over 80 characters
>      #64: FILE: drivers/net/wireless/ath/ath10k/wmi.c:1683:
>      +                       ch->band_center_freq1 = __cpu_to_le32(arg->band_center_freq1 + 40);
>      
>      ERROR: Missing Signed-off-by: line(s)
>      
>      total: 2 errors, 4 warnings, 0 checks, 34 lines checked
>      
>      NOTE: For some of the reported defects, checkpatch may be able to
>            mechanically convert to the typical style using --fix or --fix-inplace.
>      
>      NOTE: Whitespace errors detected.
>            You may wish to use scripts/cleanpatch or scripts/cleanfile
>      
>      ath10k-160mhz/v1-ath10k-fix-band_center_freq-handling-for-VHT160-in-recent-firmwares.patch has style problems, please review.
>      ----------------------------------------------------------------------------------------------------------------------------
>      ath10k-160mhz/v7-ath10k-fix-crash-in-recent-3.5.3-9984-firmware-due-wrong-handling-of-peer_bw_rxnss_override-parameter.patch
>      ----------------------------------------------------------------------------------------------------------------------------
>      WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
>      #17:
>      current handling of peer_bw_rxnss_override parameter is based on guessing the VHT160/8080 capability by rx rate. this is wrong and may lead
>      
>      WARNING: line over 80 characters
>      #73: FILE: drivers/net/wireless/ath/ath10k/mac.c:2534:
>      +       /* only 4x4 configuration do support 2x2 for VHT160, everything else must use 1x1 */
>      
>      WARNING: line over 80 characters
>      #75: FILE: drivers/net/wireless/ath/ath10k/mac.c:2536:
>      +               nss160 = arg->peer_num_spatial_streams <= 2 ? arg->peer_num_spatial_streams : 2;
>      
>      WARNING: line over 80 characters
>      #77: FILE: drivers/net/wireless/ath/ath10k/mac.c:2538:
>      +       /* in case if peer is connected with vht160 or vht80+80, we need to properly adjust rxnss parameters otherwise firmware will raise a assert */
>      
>      ERROR: space required before the open parenthesis '('
>      #78: FILE: drivers/net/wireless/ath/ath10k/mac.c:2539:
>      +       switch(arg->peer_phymode) {
>      
>      WARNING: line over 80 characters
>      #90: FILE: drivers/net/wireless/ath/ath10k/mac.c:2551:
>      +                  sta->addr, arg->peer_max_mpdu, arg->peer_flags, arg->peer_bw_rxnss_override);
>      
>      WARNING: line over 80 characters
>      #119: FILE: drivers/net/wireless/ath/ath10k/wmi.c:7214:
>      +       cmd->peer_bw_rxnss_override = __cpu_to_le32(arg->peer_bw_rxnss_override);
>      
>      CHECK: Prefer using the BIT macro
>      #132: FILE: drivers/net/wireless/ath/ath10k/wmi.h:6383:
>      +#define BW_NSS_FWCONF_MAP_ENABLE             (1 << 31)
>      
>      WARNING: line over 80 characters
>      #139: FILE: drivers/net/wireless/ath/ath10k/wmi.h:6390:
>      +#define GET_BW_NSS_FWCONF_160(x)             ((((x) & BW_NSS_FWCONF_MAP_160MHZ_M) >> BW_NSS_FWCONF_MAP_160MHZ_S) + 1)
>      
>      WARNING: line over 80 characters
>      #140: FILE: drivers/net/wireless/ath/ath10k/wmi.h:6391:
>      +#define GET_BW_NSS_FWCONF_80_80(x)           ((((x) & BW_NSS_FWCONF_MAP_80_80MHZ_M) >> BW_NSS_FWCONF_MAP_80_80MHZ_S) + 1)
>      
>      WARNING: line over 80 characters
>      #143: FILE: drivers/net/wireless/ath/ath10k/wmi.h:6394:
>      +#define BW_NSS_FWCONF_160(x)          (BW_NSS_FWCONF_MAP_ENABLE | (((x - 1) << BW_NSS_FWCONF_MAP_160MHZ_S) & BW_NSS_FWCONF_MAP_160MHZ_M))
>      
>      CHECK: Macro argument 'x' may be better as '(x)' to avoid precedence issues
>      #143: FILE: drivers/net/wireless/ath/ath10k/wmi.h:6394:
>      +#define BW_NSS_FWCONF_160(x)          (BW_NSS_FWCONF_MAP_ENABLE | (((x - 1) << BW_NSS_FWCONF_MAP_160MHZ_S) & BW_NSS_FWCONF_MAP_160MHZ_M))
>      
>      WARNING: line over 80 characters
>      #144: FILE: drivers/net/wireless/ath/ath10k/wmi.h:6395:
>      +#define BW_NSS_FWCONF_80_80(x)        (BW_NSS_FWCONF_MAP_ENABLE | (((x - 1) << BW_NSS_FWCONF_MAP_80_80MHZ_S) & BW_NSS_FWCONF_MAP_80_80MHZ_M))
>      
>      CHECK: Macro argument 'x' may be better as '(x)' to avoid precedence issues
>      #144: FILE: drivers/net/wireless/ath/ath10k/wmi.h:6395:
>      +#define BW_NSS_FWCONF_80_80(x)        (BW_NSS_FWCONF_MAP_ENABLE | (((x - 1) << BW_NSS_FWCONF_MAP_80_80MHZ_S) & BW_NSS_FWCONF_MAP_80_80MHZ_M))
>      
>      total: 1 errors, 10 warnings, 3 checks, 94 lines checked
>      
>      NOTE: For some of the reported defects, checkpatch may be able to
>            mechanically convert to the typical style using --fix or --fix-inplace.
>      
>      ath10k-160mhz/v7-ath10k-fix-crash-in-recent-3.5.3-9984-firmware-due-wrong-handling-of-peer_bw_rxnss_override-parameter.patch has style problems, please review.
>      
>      NOTE: If any of the errors are false positives, please report
>            them to the maintainer, see CHECKPATCH in MAINTAINERS.
>
> There are also general coding style problems [4]. Look for example at the way
> you format a switch:
>
>      +       /* in case if peer is connected with vht160 or vht80+80, we need to properly adjust rxnss parameters otherwise firmware will raise a assert */
>      +       switch(arg->peer_phymode) {
>      +       case MODE_11AC_VHT80_80:
>      +               arg->peer_bw_rxnss_override = BW_NSS_FWCONF_80_80(nss160);
>      +       /* fall through */
>      +       case MODE_11AC_VHT160:
>      +               arg->peer_bw_rxnss_override |= BW_NSS_FWCONF_160(nss160);
>      +       break;
>      +       default:
>      +       break;
>              }
>
> Everything after (and including) the first break seems to be misaligned.
>
>
> I hope it helps to improve the patches.
>
>
> Kind regards,
> 	Sven
>
> [1] https://github.com/openwrt/openwrt/commit/134e832814f1986c7ee06ac00806ebb6e762fd15
> [2] https://patchwork.kernel.org/patch/10365117/
> [3] https://patchwork.kernel.org/patch/10372949/
> [4] https://www.kernel.org/doc/html/v4.10/process/coding-style.html#indentation


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
